{% from "alfresco/map.jinja" import alfresco with context %}

ldap-block-replace:
  file.blockreplace:
    - name: {{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties
    - marker_start: "# LDAP : salt managed zone"
    - marker_end: "# LDAP ENDS : salt managed zone --"
    - content: |
        ldap.authentication.active={{ salt['pillar.get']('alfresco:auth:ldap:active', 'False') }}
        ldap.authentication.allowGuestLogin={{ salt['pillar.get']('alfresco:auth:ldap:allowGuestLogin', 'False') }}
        ldap.authentication.userNameFormat={{ salt['pillar.get']('alfresco:auth:ldap:userNameFormat', 'False') }}
        ldap.authentication.java.naming.factory.initial={{ salt['pillar.get']('alfresco:auth:ldap:factory', 'com.sun.jndi.ldap.LdapCtxFactory') }}
        ldap.authentication.java.naming.provider.url={{ salt['pillar.get']('alfresco:auth:ldap:url', '') }}
        ldap.authentication.java.naming.security.authentication={{ salt['pillar.get']('alfresco:auth:ldap:security', 'False') }}
        ldap.authentication.escapeCommasInBind={{ salt['pillar.get']('alfresco:auth:ldap:escapeCommasInBind', 'False') }}
        ldap.authentication.escapeCommasInUid={{ salt['pillar.get']('alfresco:auth:ldap:escapeCommasInUid', 'False') }}
        ldap.authentication.defaultAdministratorUserNames={{ salt['pillar.get']('alfresco:auth:ldap:defaultAdministratorUserNames', '') }}

ldap-sync block-replace:
  file.blockreplace:
    - name: {{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties
    - marker_start: "# LDAP SYNCHRONIZATION : salt managed zone"
    - marker_end: "# LDAP SYNCHRONIZATION ENDS : salt managed zone --"
    - content: |
        ldap.synchronization.active={{ salt['pillar.get']('alfresco:auth:ldap:sync:active', 'False') }}
        ldap.synchronization.java.naming.security.authentication={{ salt['pillar.get']('alfresco:auth:ldap:sync:security', 'simple') }}
        ldap.synchronization.java.naming.security.principal={{ salt['pillar.get']('alfresco:auth:ldap:sync:principal', 'False') }}
        ldap.synchronization.java.naming.security.credentials={{ salt['pillar.get']('alfresco:auth:ldap:sync:active', '') }}
        ldap.synchronization.queryBatchSize={{ salt['pillar.get']('alfresco:auth:ldap:sync:queryBatchSize', '500') }}
        ldap.synchronization.attributeBatchSize={{ salt['pillar.get']('alfresco:auth:ldap:sync:attributeBatchSize', '500') }}
        ldap.synchronization.groupQuery={{ salt['pillar.get']('alfresco:auth:ldap:sync:groupQuery', '(objectclass\=group)') }}
        ldap.synchronization.groupDifferentialQuery={{ salt['pillar.get']('alfresco:auth:ldap:sync:groupDifferentialQuery', '(&(objectclass\=group)(!(modifyTimestamp<\={0})))') }}
        ldap.synchronization.personQuery={{ salt['pillar.get']('alfresco:auth:ldap:sync:personQuery', '(&(objectclass\=user)(userAccountControl\:1.2.840.113556.1.4.803\:\=512))') }}
        ldap.synchronization.personDifferentialQuery={{ salt['pillar.get']('alfresco:auth:ldap:sync:personDifferentialQuery', '(&(objectclass\=user)(userAccountControl\:1.2.840.113556.1.4.803\:\=512)(!(modifyTimestamp<\={0})))') }}
        ldap.synchronization.groupSearchBase={{ salt['pillar.get']('alfresco:auth:ldap:sync:groupSearchBase', '') }}
        ldap.synchronization.userSearchBase={{ salt['pillar.get']('alfresco:auth:ldap:sync:userSearchBase', '') }}
        ldap.synchronization.modifyTimestampAttributeName={{ salt['pillar.get']('alfresco:auth:ldap:sync:modifyTimestampAttributeName', 'modifyTimestamp') }}
        ldap.synchronization.timestampFormat={{ salt['pillar.get']('alfresco:auth:ldap:sync:timestampFormat', 'yyyyMMddHHmmss'.0Z') }}'
        ldap.synchronization.userIdAttributeName={{ salt['pillar.get']('alfresco:auth:ldap:sync:userIdAttributeName', 'sAMAccountName') }}
        ldap.synchronization.userFirstNameAttributeName={{ salt['pillar.get']('alfresco:auth:ldap:sync:userFirstNameAttributeName', 'givenName') }}
        ldap.synchronization.userLastNameAttributeName={{ salt['pillar.get']('alfresco:auth:ldap:sync:userLastNameAttributeName', 'sn') }}
        ldap.synchronization.userEmailAttributeName={{ salt['pillar.get']('alfresco:auth:ldap:sync:userEmailAttributeName', 'mail') }}
        ldap.synchronization.userOrganizationalIdAttributeName={{ salt['pillar.get']('alfresco:auth:ldap:sync:userOrganizationalIdAttributeName', 'o') }}
        ldap.synchronization.defaultHomeFolderProvider={{ salt['pillar.get']('alfresco:auth:ldap:sync:defaultHomeFolderProvider', 'userHomesHomeFolderProvider') }}
        ldap.synchronization.groupIdAttributeName={{ salt['pillar.get']('alfresco:auth:ldap:sync:groupIdAttributeName', 'cn') }}
        ldap.synchronization.groupDisplayNameAttributeName={{ salt['pillar.get']('alfresco:auth:ldap:sync:groupDisplayNameAttributeName', 'fullName') }}
        ldap.synchronization.groupType={{ salt['pillar.get']('alfresco:auth:ldap:sync:groupType', 'group') }}
        ldap.synchronization.personType={{ salt['pillar.get']('alfresco:auth:ldap:sync:personType', 'user') }}
        ldap.synchronization.groupMemberAttributeName={{ salt['pillar.get']('alfresco:auth:ldap:sync:groupMemberAttributeName', 'member') }}
        ldap.synchronization.enableProgressEstimation={{ salt['pillar.get']('alfresco:auth:ldap:sync:enableProgressEstimation', 'False') }}
