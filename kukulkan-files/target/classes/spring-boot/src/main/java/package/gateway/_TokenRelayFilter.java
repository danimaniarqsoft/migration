package <%=packageName%>.gateway;
<%_ if (authenticationType === 'oauth2') { _%>

import <%=packageName%>.security.oauth2.AuthorizationHeaderUtil;
<%_ } _%>

import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import org.springframework.stereotype.Component;
<%_ if (authenticationType === 'jwt' || authenticationType === 'uaa') { _%>

import java.util.Set;
<%_ } _%>

@Component
public class TokenRelayFilter extends ZuulFilter {
<%_ if (authenticationType === 'oauth2') { _%>

    public static final String AUTHORIZATION_HEADER = "Authorization";
<%_ } _%>

    @Override
    public Object run() {
        RequestContext ctx = RequestContext.getCurrentContext();
        <%_ if (authenticationType === 'jwt' || authenticationType === 'uaa') { _%>
        Set<String> headers = (Set<String>) ctx.get("ignoredHeaders");
        // JWT tokens should be relayed to the resource servers
        headers.remove("authorization");
        <%_ } _%>
        <%_ if (authenticationType === 'oauth2') { _%>
        // Add specific authorization headers for OAuth2
        if (AuthorizationHeaderUtil.getAuthorizationHeader().isPresent()) {
            ctx.addZuulRequestHeader(AUTHORIZATION_HEADER,
                AuthorizationHeaderUtil.getAuthorizationHeader().get());

        }
        <%_ } _%>
        return null;
    }

    @Override
    public boolean shouldFilter() {
        return true;
    }

    @Override
    public String filterType() {
        return "pre";
    }

    @Override
    public int filterOrder() {
        return 10000;
    }
}
