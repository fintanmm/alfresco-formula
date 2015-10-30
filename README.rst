================
alfresco-formula
================

A saltstack formula that installs and configures Alfresco community addition. An enterprise content management system.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

.. note::
    No checks are in place to insure that the authentication chain is correct. 

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

Enables cifs support within the global-properties file.

``alfresco.nfs``
------------

Enables nfs support within the global-properties file.

``alfresco.ftp``
------------

Enables ftp support within the global-properties file.

``alfresco.imap``
------------

Enables imap support within the global-properties file.

``alfresco.smtp``
------------

Enables smtp support within the global-properties file.

``alfresco.ntlm``
------------

Enables ntlm authentication support within the global-properties file.

``alfresco.passthru``
------------

Enables passthru authentication support within the global-properties file.

``alfresco.ldap``
------------

Enables ldap authentication support within the global-properties file.


