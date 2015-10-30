{% from "alfresco/map.jinja" import alfresco with context %}

mail-block-replace:
  file.blockreplace:
  - name: {{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties
  - marker_start: "# MAIL : salt managed zone"
  - marker_end: "# MAIL ENDS : salt managed zone --"
  - content: |
      mail.host={{ salt['pillar.get']('alfresco:mail:host', '0.0.0.0') }}
      mail.port={{ salt['pillar.get']('alfresco:mail:port', 25) }}
      mail.username={{ salt['pillar.get']('alfresco:mail:username', 'anonymous') }}
      mail.password={{ salt['pillar.get']('alfresco:mail:password', '') }}
      mail.protocol={{ salt['pillar.get']('alfresco:mail:protocol', 'smtp') }}
      mail.encoding={{ salt['pillar.get']('alfresco:mail:encoding', 'UTF-8') }}
      notification.email.siteinvite={{ salt['pillar.get']('alfresco:mail:siteinvite', 'False') }}
     
OutboundSMTP-block-replace:
  file.blockreplace:
  - name: {{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties
  - marker_start: "# OutboundSMTP : salt managed zone"
  - marker_end: "# OutboundSMTP ENDS : salt managed zone --"
  - content: |
      {% if salt['pillar.get']('alfresco:mail:starttls', 'False') %}
      mail.smtps.starttls.enable={{ salt['pillar.get']('alfresco:mail:starttls', 'False') }}
      mail.smtps.auth={{ salt['pillar.get']('alfresco:mail:auth', 'False') }}      
      {% else %}
      mail.smtp.starttls.enable={{ salt['pillar.get']('alfresco:mail:starttls', 'False') }}
      mail.smtp.auth={{ salt['pillar.get']('alfresco:mail:auth', 'False') }}
      mail.smtp.timeout={{ salt['pillar.get']('alfresco:mail:timeout', '30000') }}
      {% endif %}      

InboundSMTP-block-replace:
  file.blockreplace:
  - name: {{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties
  - marker_start: "# InboundSMTP : salt managed zone"
  - marker_end: "# InboundSMTP ENDS : salt managed zone --"
  - content: |
      email.inbound.unknownUser={{ salt['pillar.get']('alfresco:mail:username', 'anonymous') }}
      email.server.enabled={{ salt['pillar.get']('alfresco:mail:server:enabled', 'False') }}
      email.server.port={{ salt['pillar.get']('alfresco:mail:server:port', 25) }}
      email.server.domain={{ salt['pillar.get']('alfresco:mail:server:domain', salt['grains.get']('domain']) ) }}
      email.server.allowed.senders={{ salt['pillar.get']('alfresco:mail:server:allowed', salt['grains.get']('domain']) ) }}
      email.server.blocked.senders={{ salt['pillar.get']('alfresco:mail:server:blocked', salt['grains.get']('domain']) ) }}
             