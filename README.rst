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

Downloads the alfresco zip file and extracts it. Then creates the global-properties file.

``alfresco.db``
------------

Updates the global-properties file with database configuration.

``alfresco.repo``
------------

Copies the alfresco.war file to the tomcat webapps directory. Updates the global-properties file.

``alfresco.share``
------------

Copies the alfresco.war file to the tomcat webapps directory. Updates the global-properties file.

``alfresco.cifs``
------------

Enables cifs support then updates the global-properties file with the required configuration.

``alfresco.nfs``
------------

Enables cifs support then updates the global-properties file with the required configuration.
