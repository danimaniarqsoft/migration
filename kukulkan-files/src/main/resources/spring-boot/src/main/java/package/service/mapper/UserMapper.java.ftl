package <%=packageName%>.service.mapper;

<%_ if (databaseType === 'sql' || databaseType === 'mongodb') { _%>
import <%=packageName%>.domain.Authority;
<%_ } _%>
import <%=packageName%>.domain.User;
import <%=packageName%>.service.dto.UserDTO;

import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * Mapper for the entity User and its DTO called UserDTO.
 *
 * Normal mappers are generated using MapStruct, this one is hand-coded as MapStruct
 * support is still in beta, and requires a manual step with an IDE.
 */
@Service
public class UserMapper {

    public UserDTO userToUserDTO(User user) {
        return new UserDTO(user);
    }

    public List<UserDTO> usersToUserDTOs(List<User> users) {
        return users.stream()
            .filter(Objects::nonNull)
            .map(this::userToUserDTO)
            .collect(Collectors.toList());
    }

    public User userDTOToUser(UserDTO userDTO) {
        if (userDTO == null) {
            return null;
        } else {
            User user = new User();
            user.setId(userDTO.getId());
            user.setLogin(userDTO.getLogin());
            user.setFirstName(userDTO.getFirstName());
            user.setLastName(userDTO.getLastName());
            user.setEmail(userDTO.getEmail());
            <%_ if (databaseType !== 'cassandra') { _%>
            user.setImageUrl(userDTO.getImageUrl());
            <%_ } _%>
            user.setActivated(userDTO.isActivated());
            user.setLangKey(userDTO.getLangKey());
            <%_ if (databaseType === 'sql' || databaseType === 'mongodb') { _%>
            Set<Authority> authorities = this.authoritiesFromStrings(userDTO.getAuthorities());
            if (authorities != null) {
                user.setAuthorities(authorities);
            }
            <%_ } _%>
            <%_ if (databaseType === 'cassandra' || databaseType === 'couchbase') { _%>
            user.setAuthorities(userDTO.getAuthorities());
            <%_ } _%>
            return user;
        }
    }

    public List<User> userDTOsToUsers(List<UserDTO> userDTOs) {
        return userDTOs.stream()
            .filter(Objects::nonNull)
            .map(this::userDTOToUser)
            .collect(Collectors.toList());
    }

    public User userFromId(<% if (databaseType === 'mongodb' || databaseType === 'couchbase' || databaseType === 'cassandra') { %>String<% } else { %>Long<% } %> id) {
        if (id == null) {
            return null;
        }
        User user = new User();
        user.setId(id);
        return user;
    }
    <%_ if (databaseType === 'sql' || databaseType === 'mongodb') { _%>

    public Set<Authority> authoritiesFromStrings(Set<String> strings) {
        return strings.stream().map(string -> {
            Authority auth = new Authority();
            auth.setName(string);
            return auth;
        }).collect(Collectors.toSet());
    }
    <%_ } _%>
}
