Project dependencies (according to POMs):

```
project1
|-- project2:compile
|..|-- jetty-server:compile
|....|-- javax.servlet-api:3.1.0:compile
|-- jersey-test-framework-core:test
|..|-- javax.servlet-api:3.0.1:compile
```

maven-dependency-plugin (2.8, 2.10, 3.0.0) for project1 uses nearest-first strategy to resolve conflicts and resolves javax.servlet-api version to be 3.0.1 in spite of test scope being non-transitive [1]:

```
--- maven-dependency-plugin:2.10:tree (default-cli) @ project1 ---
org.example:project1:jar:1.0-SNAPSHOT
+- org.example:project2:jar:1.0-SNAPSHOT:compile
|  \- org.eclipse.jetty:jetty-server:jar:9.3.6.v20151106:compile
|     +- javax.servlet:javax.servlet-api:jar:3.0.1:compile
...
\- org.glassfish.jersey.test-framework:jersey-test-framework-core:jar:2.22.1:test
...
   +- (javax.servlet:javax.servlet-api:jar:3.0.1:compile - scope updated from test; omitted for duplicate)
...
```

[1] http://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html
