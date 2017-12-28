package <%=packageName%>.security;

import <%=packageName%>.domain.User;
import <%=packageName%>.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;<% if (databaseType === 'sql') { %>
import org.springframework.transaction.annotation.Transactional;<%}%>

import java.util.*;
import java.util.stream.Collectors;

/**
 * Authenticate a user from the database.
 */
@Component("userDetailsService")
public class DomainUserDetailsService implements UserDetailsService {

    private final Logger log = LoggerFactory.getLogger(DomainUserDetailsService.class);

    private final UserRepository userRepository;

    public DomainUserDetailsService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override<% if (databaseType === 'sql') { %>
    @Transactional<%}%>
    public UserDetails loadUserByUsername(final String login) {
        log.debug("Authenticating {}", login);
        String lowercaseLogin = login.toLowerCase(Locale.ENGLISH);
        <%_ if (databaseType === 'sql') { _%>
        Optional<User> userByEmailFromDatabase = userRepository.findOneWithAuthoritiesByEmail(lowercaseLogin);
        <%_ } else { // MongoDB and Cassandra _%>
        Optional<User> userByEmailFromDatabase = userRepository.findOneByEmailIgnoreCase(lowercaseLogin);
        <%_ } _%>
        return userByEmailFromDatabase.map(user -> createSpringSecurityUser(lowercaseLogin, user)).orElseGet(() -> {
            <%_ if (databaseType === 'sql') { _%>
            Optional<User> userByLoginFromDatabase = userRepository.findOneWithAuthoritiesByLogin(lowercaseLogin);
            <%_ } else { // MongoDB and Cassandra _%>
            Optional<User> userByLoginFromDatabase = userRepository.findOneByLogin(lowercaseLogin);
            <%_ } _%>
            return userByLoginFromDatabase.map(user -> createSpringSecurityUser(lowercaseLogin, user))
                .orElseThrow(() -> new UsernameNotFoundException("User " + lowercaseLogin + " was not found in the " +
                    "database"));
        });
    }

    private org.springframework.security.core.userdetails.User createSpringSecurityUser(String lowercaseLogin, User user) {
        if (!user.getActivated()) {
            throw new UserNotActivatedException("User " + lowercaseLogin + " was not activated");
        }
        List<GrantedAuthority> grantedAuthorities = user.getAuthorities().stream()<% if (databaseType === 'sql' || databaseType === 'mongodb') { %>
            .map(authority -> new SimpleGrantedAuthority(authority.getName()))<% } %><% if (databaseType === 'cassandra' || databaseType === 'couchbase') { %>
            .map(authority -> new SimpleGrantedAuthority(authority))<% } %>
            .collect(Collectors.toList());
        return new org.springframework.security.core.userdetails.User(user.getLogin(),
            user.getPassword(),
            grantedAuthorities);
    }
}
