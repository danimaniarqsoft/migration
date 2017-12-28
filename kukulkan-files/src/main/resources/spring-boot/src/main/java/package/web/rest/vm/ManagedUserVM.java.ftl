package <%=packageName%>.web.rest.vm;

import <%=packageName%>.service.dto.UserDTO;
import javax.validation.constraints.Size;

/**
 * View Model extending the UserDTO, which is meant to be used in the user management UI.
 */
public class ManagedUserVM extends UserDTO {
<%_ if (authenticationType !== 'oauth2') { _%>

    public static final int PASSWORD_MIN_LENGTH = 4;

    public static final int PASSWORD_MAX_LENGTH = 100;

    @Size(min = PASSWORD_MIN_LENGTH, max = PASSWORD_MAX_LENGTH)
    private String password;
<%_ } _%>

    public ManagedUserVM() {
        // Empty constructor needed for Jackson.
    }
    <%_ if (authenticationType !== 'oauth2') { _%>

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    <%_ } _%>

    @Override
    public String toString() {
        return "ManagedUserVM{" +
            "} " + super.toString();
    }
}
