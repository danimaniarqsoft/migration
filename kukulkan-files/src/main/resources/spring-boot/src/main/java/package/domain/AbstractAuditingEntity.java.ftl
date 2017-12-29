package <%=packageName%>.domain;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnore;<% if (databaseType === 'sql') { %>
import org.hibernate.envers.Audited;<% } %>
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;<% if (databaseType === 'mongodb') { %>
import org.springframework.data.mongodb.core.mapping.Field;
import java.time.Instant;
<% } %><% if (databaseType === 'couchbase') { %>
import com.couchbase.client.java.repository.annotation.Field;
import java.time.Instant;
<% } %><% if (databaseType === 'sql') { %>
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import java.time.Instant;
import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;<% } %>

/**
 * Base abstract class for entities which will hold definitions for created, last modified by and created,
 * last modified by date.
 */<% if (databaseType === 'sql') { %>
@MappedSuperclass
@Audited
@EntityListeners(AuditingEntityListener.class)<% } %>
public abstract class AbstractAuditingEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @CreatedBy<% if (databaseType === 'sql') { %>
    @Column(name = "created_by", nullable = false, length = 50, updatable = false)<% } %><% if (databaseType === 'mongodb' || databaseType === 'couchbase') { %>
    @Field("created_by")<% } %>
    @JsonIgnore
    private String createdBy;

    @CreatedDate<% if (databaseType === 'sql') { %>
    @Column(name = "created_date", nullable = false)<% } %><% if (databaseType === 'mongodb' || databaseType === 'couchbase') { %>
    @Field("created_date")<% } %>
    @JsonIgnore
    private Instant createdDate = Instant.now();

    @LastModifiedBy<% if (databaseType === 'sql') { %>
    @Column(name = "last_modified_by", length = 50)<% } %><% if (databaseType === 'mongodb' || databaseType === 'couchbase') { %>
    @Field("last_modified_by")<% } %>
    @JsonIgnore
    private String lastModifiedBy;

    @LastModifiedDate<% if (databaseType === 'sql') { %>
    @Column(name = "last_modified_date")<% } %><% if (databaseType === 'mongodb' || databaseType === 'couchbase') { %>
    @Field("last_modified_date")<% } %>
    @JsonIgnore
    private Instant lastModifiedDate = Instant.now();

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Instant getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Instant createdDate) {
        this.createdDate = createdDate;
    }

    public String getLastModifiedBy() {
        return lastModifiedBy;
    }

    public void setLastModifiedBy(String lastModifiedBy) {
        this.lastModifiedBy = lastModifiedBy;
    }

    public Instant getLastModifiedDate() {
        return lastModifiedDate;
    }

    public void setLastModifiedDate(Instant lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
    }
}