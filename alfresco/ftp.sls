{% from "alfresco/map.jinja" import alfresco with context %}

ftp-block-replace:
  file.blockreplace:
    - name: {{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties
    - marker_start: "# FTP : salt managed zone"
    - marker_end: "# FTP ENDS : salt managed zone --"
    - content: |
        ftp.enabled={{ salt['pillar.get']('alfresco:ftp_enabled', 'false') }}
        ftp.port={{ salt['pillar.get']('alfresco:ftp:port', '2121') }}
        ftp.bindto={{ salt['pillar.get']('alfresco:ftp:bindto', '') }}
        ftp.dataPortFrom={{ salt['pillar.get']('alfresco:ftp:dataPortFrom', '') }}
        ftp.dataPortTo={{ salt['pillar.get']('alfresco:ftp:dataPortTo', '') }}
        ftp.keyStore={{ salt['pillar.get']('alfresco:ftp:keyStore', '') }}
        ftp.trustStore={{ salt['pillar.get']('alfresco:ftp:trustStore', '') }}
        ftp.passphrase={{ salt['pillar.get']('alfresco:ftp:passphrase', '') }}
        ftp.requireSecureSession={{ salt['pillar.get']('alfresco:ftp:requireSecureSession', 'true') }}
        ftp.sslEngineDebug={{ salt['pillar.get']('alfresco:ftp:sslEngineDebug', 'false') }}
        ftp.sessionDebug={{ salt['pillar.get']('alfresco:ftp:sessionDebug', 'false') }}
