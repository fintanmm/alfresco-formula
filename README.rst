================
alfresco-formula
================

A saltstack formula that installs and configures Alfresco community addition. An enterprise content management system.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

[Authentication Documentation](http://docs.alfresco.com/community/concepts/auth-subsystem-types.html)

*No checks are in place to insure that the authentication chain is correct.*

TODO
================
* solr
* keystores
* url(s)
* office
* replication
* file transfers
* backup 
* restore
* auditing
* logging
* kerberos
* sso
* imap attachments

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

``alfresco.url``
------------

Updates the global-properties file with url configuration.

``alfresco.repo``
------------

Copies the alfresco.war file to the tomcat webapps directory. Updates the global-properties file with the url configuration.

``alfresco.share``
------------

Copies the share.war file to the tomcat webapps directory. Updates the global-properties file with the url configuration.

``alfresco.solr``
------------

Copies the needed solr files/directories to the specified directory. Updates the global-properties file.

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

``alfresco.chain``
------------

Enables the authenticaion chain support within the global-properties file.

``alfresco.ntlm``
------------

Enables ntlm authentication support within the global-properties file.

``alfresco.passthru``
------------

Enables passthru authentication support within the global-properties file.

``alfresco.ldap``
------------

Enables ldap authentication support within the global-properties file.

``alfresco.ldap-ad``
------------

Enables ldap-ad authentication support within the global-properties file.

``alfresco.kerberos``
------------

Placeholder for enabling kerberos authentication support within the global-properties file.

``alfresco.external``
------------

Placeholder for enabling external authentication support within the global-properties file.
