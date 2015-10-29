{% from "alfresco/map.jinja" import alfresco with context %}

nfs-block-replace:
  file.blockreplace:
    - name: {{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties
    - marker_start: "# NFS : salt managed zone"
    - marker_end: "# NFS ENDS : salt managed zone --"
    - content: |
        nfs.enabled={{ salt['pillar.get']('alfresco:nfs:enabled', 'false') }}
        nfs.nodeMonitor={{ salt['pillar.get']('alfresco:nfs:nodeMonitor', '${nfs.enabled}') }}
        nfs.mountServerPort={{ salt['pillar.get']('alfresco:nfs:mountServerPort', 0) }}
        nfs.nfsServerPort={{ salt['pillar.get']('alfresco:nfs:nfsServerPort', '2049') }}
        nfs.rpcRegisterPort={{ salt['pillar.get']('alfresco:nfs:rpcRegisterPort', '0') }}
        nfs.portMapperPort={{ salt['pillar.get']('alfresco:nfs:portMapperPort', '111') }}
        nfs.portMapperEnabled={{ salt['pillar.get']('alfresco:nfs:portMapperEnabled', 'false') }}
        nfs.sessionDebug={{ salt['pillar.get']('alfresco:nfs:sessionDebug', '') }}  
        nfs.mountServerDebug={{ salt['pillar.get']('alfresco:nfs:mountServerDebug', 'false') }}