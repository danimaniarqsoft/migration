package <%=packageName%>.repository;

import <%=packageName%>.domain.Authority;<% if (databaseType === 'sql') { %>

import org.springframework.data.jpa.repository.JpaRepository;<% } %><% if (databaseType === 'mongodb') { %>

import org.springframework.data.mongodb.repository.MongoRepository;<% } %>

<% if (databaseType === 'sql') { %>/**
 * Spring Data JPA repository for the Authority entity.
 */<% } %><% if (databaseType === 'mongodb') { %>/**
 * Spring Data MongoDB repository for the Authority entity.
 */<% } %><% if (databaseType === 'couchbase') { %>/**
 * Spring Data Couchbase repository for the Authority entity.
 */<% } %>
public interface AuthorityRepository extends <% if (databaseType === 'sql') { %>JpaRepository<% } %><% if (databaseType === 'mongodb') { %>MongoRepository<% } %><% if (databaseType === 'couchbase') { %>N1qlCouchbaseRepository<% } %><Authority, String> {
}
