{% from "alfresco/map.jinja" import alfresco with context %}

kerberos-block-replace:
  file.blockreplace:
    - name: {{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties
    - marker_start: "# KERBEROS : salt managed zone"
    - marker_end: "# KERBEROS ENDS : salt managed zone --"
    - content: |
        kerberos.authentication.realm={{ salt['pillar.get']('alfresco:auth:kerberos:realm', '') }}
        kerberos.authentication.sso.enabled={{ salt['pillar.get']('alfresco:auth:kerberos:sso:enabled', 'true') }}
        kerberos.authentication.sso.fallback.enabled={{ salt['pillar.get']('alfresco:auth:kerberos:fallback:enabled', 'true') }}
        kerberos.authentication.authenticateCIFS={{ salt['pillar.get']('alfresco:auth:kerberos:authenticateCIFS', 'true') }}
        kerberos.authentication.cifs.password={{ salt['pillar.get']('alfresco:auth:kerberos:cifs:password') }}
        kerberos.authentication.http.password={{ salt['pillar.get']('alfresco:auth:kerberos:http:password') }}
        kerberos.authentication.user.configEntryName={{ salt['pillar.get']('alfresco:auth:kerberos:user:configEntryName', 'Alfresco') }}
        kerberos.authentication.cifs.configEntryName={{ salt['pillar.get']('alfresco:auth:kerberos:cifs:configEntryName', 'AlfrescoCIFS') }}
        kerberos.authentication.http.configEntryName={{ salt['pillar.get']('alfresco:auth:kerberos:http:configEntryName', 'AlfrescoHTTP') }}
        kerberos.authentication.defaultAdministratorUserNames={{ salt['pillar.get']('alfresco:auth:kerberos:defaultAdministratorUserNames', 'admin') }}
        kerberos.authentication.browser.ticketLogons={{ salt['pillar.get']('alfresco:auth:kerberos:browser:ticketLogons', 'true') }}
        kerberos.authentication.stripUsernameSuffix={{ salt['pillar.get']('alfresco:auth:kerberos:stripUsernameSuffix', 'true') }}