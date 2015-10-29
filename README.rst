================
alfresco-formula
================

A saltstack formula that installs and configures Alfresco community addition. An enterprise content management system.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``alfresco``
------------

Downloads the alfresco zip file and extracts it.

``alfresco.db``
------------

Creates/Updates the global-properties file with database configuration.

``alfresco.repo``
------------

Copies the alfresco.war file to the tomcat webapps directory. Creates/Updates the global-properties file.

``alfresco.share``
------------

Copies the alfresco.war file to the tomcat webapps directory. Creates/Updates the global-properties file.

``alfresco.cifs``
------------

Creates/Updates the global-properties file with cifs configuration.
