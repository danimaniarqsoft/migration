package <%=packageName%>.domain;

<%_ if (enableHibernateCache) { _%>
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
<%_ } _%>
<%_ if (databaseType === 'mongodb' || databaseType === 'couchbase') { _%>
import org.springframework.data.annotation.Id;
import org.springframework.data.<%= databaseType %>.core.mapping.Document;
<%_ } _%>
<%_ if (databaseType === 'sql') { _%>
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Column;
<%_ } _%>
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * An authority (a security role) used by Spring Security.
 */
<%_ if (databaseType === 'sql') { _%>
@Entity
@Table(name = "<%= jhiTablePrefix %>_authority")
    <%_ if (enableHibernateCache) { _%>
        <%_ if (cacheProvider === 'infinispan') { _%>
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
        <%_ } else { _%>
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
        <%_ } _%>
    <%_ } _%>
<%_ } _%>
<%_ if (databaseType === 'mongodb') { _%>
@Document(collection = "<%= jhiTablePrefix %>_authority")
<%_ } _%><% if (databaseType === 'couchbase') { %>
@Document<% } %>
public class Authority implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotNull
    @Size(max = 50)
    @Id<% if (databaseType === 'sql') { %>
    @Column(length = 50)<% } %>
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        Authority authority = (Authority) o;

        return !(name != null ? !name.equals(authority.name) : authority.name != null);
    }

    @Override
    public int hashCode() {
        return name != null ? name.hashCode() : 0;
    }

    @Override
    public String toString() {
        return "Authority{" +
            "name='" + name + '\'' +
            "}";
    }
}
