{% from "alfresco/map.jinja" import alfresco with context %}

external-block-replace:
  file.blockreplace:
    - name: {{ alfresco.tomcat_dir }}/shared/classes/alfresco-global.properties
    - marker_start: "# EXTERNAL TOOLS : salt managed zone"
    - marker_end: "# EXTERNAL TOOLS ENDS : salt managed zone --"
    - content: |
        externaltools.ooo.exe={{ salt['pillar.get']('alfresco:externaltools:ooo:exe', '/usr/bin/soffice') }}
        externaltools.ooo.enabled={{ salt['pillar.get']('alfresco:externaltools:ooo:enabled', 'true') }}
        externaltools.ooo.port={{ salt['pillar.get']('alfresco:externaltools:ooo:port', '8100') }}
        externaltools.ooo.host={{ salt['pillar.get']('alfresco:externaltools:ooo:host', 'locahost') }}
        externaltools.img.root={{ salt['pillar.get']('alfresco:externaltools:img:root', '/usr') }}
        externaltools.img.dyn={{ salt['pillar.get']('alfresco:externaltools:img:dyn', '${img.root}/lib') }}
        externaltools.img.exe={{ salt['pillar.get']('alfresco:externaltools:img:exe', '${img.root}/bin/convert') }}
        externaltools.swf.exe={{ salt['pillar.get']('alfresco:externaltools:swf:exe', '/usr/bin/pdf2swf') }}
        externaltools.jodconverter.enabled={{ salt['pillar.get']('alfresco:externaltools:jodconverter.enabled', 'true') }}
        externaltools.jodconverter.officeHome={{ salt['pillar.get']('alfresco:externaltools:jodconverter.officeHome', '/usr/lib/libreoffice') }}
        externaltools.jodconverter.portNumbers={{ salt['pillar.get']('alfresco:externaltools:jodconverter.portNumbers', '8100') }}
        externaltools.ffmpeg.exe={{ salt['pillar.get']('alfresco:externaltools:ffmpeg.exe', '/usr/bin/ffmpeg') }}