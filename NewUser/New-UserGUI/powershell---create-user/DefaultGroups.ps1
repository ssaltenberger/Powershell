#Default CCNA Security Groups

$CCNADepartments = @("Administration","Applications","Customer Support","Engineering","Human Resources","IT","Procurement","Production","Electrician","Automation System Specialist","Project Management","QHSE","Sales","Marketing","Application Developers","Robotics Systems Integrators","Software Support","Warehouse")

$CCNAManagers = @{Administration = "HSCH"; Applications = "LGRA"; CS = "JKUU"; Engineering = "JBER"; HumanResources = "JHUN"; IT = "DKLO"; Marketing = "LVAU"; Procurement = "DUNS"; Production = "DWIE"; ProjectManagement = "BVAN"; QHSE = "MLOC"; Sales = "DRIC"; ApplicationDevelopers = "CELL"; RoboticsSystemsIntegrators = "MSIN"; SoftwareSupport = "GAGA"; Warehouse = "DWIE"}

$CCNASecDefaultGroups = @("CCNA Users","CC_IFS_Users","CC_Confluence_Users","Windchill","CCNA RADIUS Access","CCNA RDP Checkpoint VPN Remote Users","CCNA Intranet","CC_Teamviewer_users")

$CCNASecAdmnistration = @("CC_IMS","CCNA Administration Team","CCNA Fax Operators")
$CCNASecApplications = @("CC_Jira_Users","CCNA Applications","CCNA Sales Concepts","CCNA Sales")
$CCNASecCS = @("CC_Jira_Users","CCNA Customer Care","CCNA Customer Care Visual Studio .NET Access","CCNA Electrical Design","CCNA Sales")
$CCNASecEngineering = @("CC_IMS","CCNA Engineering Team","CCNA Inventor Users","CCNA Mechanical Design")
$CCNASecHR = @("CC_IMS","CCNA Accident Incident","CCNA CIMO Project","CCNA Human Resources Admin","CCNA Joint Health and Safety Committee","CCNA Organization Users","CCNA QHSE","CCNA Safety Users")
$CCNASecIT = @("CC_IMS","CC_Jira_Users","CC_BitBucket_Users","CCNA Network Admin","CCNA Fax Operators","CCNA Information Systems","CCNA Inventor Users","CCNA Mechanical Design","CCNA Organization Management","CCNA Traffic","CCNA Server Room")
$CCNASecProcurement = @("CC_IMS","CCNA Purchasing Users","CCNA Visual Manufacturing","CCNA Procurement Printer")
$CCNASecProduction = @("CC_IMS","CCNA Mechanical Design Browsers","CCNA Production","CCNA Quality Control Browsers","CCNA Safety Users","CCNA Traffic","CCNA Shop Users")
$CCNASecElectrician = @("CC_IMS","CCNA Electrical Design Browsers","CCNA Wire Tag","CCNA Shop Users")
$CCNASecAutomationSpecialist = @("CC_IMS","CCNA Mechanical Design Browsers","CCNA Shop Users")
$CCNASecPM = @("CC_IMS","CCNA Project Managers","CCNA Sales","CCNA Quote Users")
$CCNASecQHSE = @("CC_IMS","CCNA Accident Incident","CCNA ISO","CCNA Operations Team","CCNA Purchasing Users","CCNA QHSE","CCNA Safety Users")
$CCNASecSales = @("CC_IMS","CC_Jira_Users","CCNA Project Financial Info","CCNA Sales Concepts","CCNA Sales","Bynder_Level1")
$CCNASecMarketing = @("CC_IMS","CCNA Marketing Users","CCNA PDF Posting","CCNA Quality Control Browsers","CCNA Sales","Bynder_Level5")
$CCNASecAppDev = @("CC_smsauth_allowed","CC_IMS","CC_Jira_Users","CC_BitBucket_Users","CCNA Software")
$CCNASecRSI = @("CC_IMS","CC_BitBucket_Users","CC_Jira_Users","CCNA Software")
$CCNASecSoftwareSupport = @("CC_IMS","CC_BitBucket_Users","CC_Jira_Users","CCNA Customer Care","CCNA Customer Care Visual Studio .NET Access","CCNA Electrical Design Browsers","CCNA Software")
$CCNASecWarehouse = @("CC_IMS","CCNA Production","CCNA Quality Control Browsers","CCNA Safety Users","CCNA Traffic")

#Default CCNA Distribution Groups

#$CCNADistDefaultGroups = @("Cimcorp Automation Ltd",)

$CCNADistAdministration = @("Cimcorp Automation Ltd","CCNA_VisualUsers")
$CCNADistApplications = @("Cimcorp Automation Ltd","CCNA_Estimating")
$CCNADistCS = @("Cimcorp Automation Ltd","CCNA_CustomerSupportTeamCCNA","CCNA_HelpDesk","CCNA_Customer Support Team")
$CCNADistEngineering = @("Cimcorp Automation Ltd","CCNA_EngineeringTeam","CCNA_Inventor Users")
$CCNADistHR = @("Cimcorp Automation Ltd")
$CCNADistIT = @("Cimcorp Automation Ltd","CC_GLOBAL_CORP_IT")
$CCNADistProcurement = @("Cimcorp Automation Ltd","CCNA_supplychainteam_na","CCNA_Purchasing")
$CCNADistProduction = @("Cimcorp Automation Ltd","CCNA_supplychainteam_na","CCNA_ShopUsers")
$CCNADistElectrician = @("Cimcorp Automation Ltd","CCNA_ShopUsers")
$CCNADistAutomationSpecialist = @("Cimcorp Automation Ltd","CCNA_ShopUsers")
$CCNADistPM = @("Cimcorp Automation Ltd","CCNA_ProjectManagers")
$CCNADistQHSE = @("Cimcorp Automation Ltd","CCNA_OperationsTeam","CCNA_QHSE")
$CCNADistSales = @("Cimcorp Automation Ltd")
$CCNADistMarketing = @("Cimcorp Automation Ltd","CCNA_SalesGroup","CCNA_MARCOM","CC_GLOBAL_MARCOM")
$CCNADistAppDev = @("Cimcorp Automation Ltd","CCNA_Software","CCNA_APPLICATION_DEVELOPERS")
$CCNADistRSI = @("Cimcorp Automation Ltd","CCNA_Software","CCNA_ROBOTICS_SYSTEMS_INTEGRATORS")
$CCNADistSoftwareSupport = @("Cimcorp Automation Ltd","CCNA_CustomerSUpportTeamCCNA","CCNA_Software","CCNA_HelpDesk","CCNA_Customer Support Team")
$CCNADistWarehouse = @("Cimcorp Automation Ltd","CCNA_RMA_Admin")

#Default CCOY Groups

#Default CCUS Groups

#Default CCIN Groups

#Default CCIB Groups


####### Users Sampled from CCNA to get Group Membership #######
#
#
# Admin - Debbie McCluskey
# PS C:\WINDOWS\system32> Get-ADPrincipalGroupMembership -Identity dmcc | select -Property name,groupcategory

# name                                 groupcategory
# ----                                 -------------
# Domain Users                              Security
# CC_IMS                                    Security
# CC_IFS_Users_Test                         Security
# CC_IFS_Users                              Security
# Windchill                                 Security
# CC_Jira_Users                             Security
# CC_Confluence_Users                       Security
# CCNA_Accounting                       Distribution
# Cimcorp Automation Ltd                    Security
# CCNA_VisualUsers                      Distribution
# CCNA Users                                Security
# CCNA Accounting Admin                     Security
# CCNA Accounting                           Security
# CCNA Administration Team                  Security
# CCNA Customer Care                        Security
# CCNA Fax Operators                        Security
# CCNA Human Resources Admin                Security
# CCNA Inventory Users                      Security
# CCNA Quality Control Users                Security
# CCNA RADIUS Meraki WIFI Access            Security
# CCNA RDP Checkpoint VPN Remote Users      Security
# CCNA Visual Manufacturing                 Security
# CCNA Intranet                             Security
# intranet-GeekyTeam                        Security
#
#
# Applications - Adam Higgins
# PS C:\WINDOWS\system32> Get-ADPrincipalGroupMembership -Identity ahig | select -Property name,groupcategory

# name                                 groupcategory
# ----                                 -------------
# Domain Users                              Security
# CC_IMS                                    Security
# CC_IFS_Users_Test                         Security
# CC_IFS_Users                              Security
# Windchill                                 Security
# CC_Jira_Users                             Security
# CC_Confluence_Users                       Security
# Cimcorp Automation Ltd                    Security
# CCNA_Estimating                       Distribution
# CCNA Users                                Security
# CCNA Applications                         Security
# CCNA RADIUS Meraki WIFI Access            Security
# CCNA RDP Checkpoint VPN Remote Users      Security
# CCNA Sales Concepts                       Security
# CCNA Sales                                Security
# CCNA Intranet                             Security
# CCNA Sales Applications Printer           Security
# intranet-GeekyTeam                        Security
#
#
# CS - Andrew McCaig
# PS C:\WINDOWS\system32> Get-ADPrincipalGroupMembership -Identity amcc | select -Property name,groupcategory

# name                                         groupcategory
# ----                                         -------------
# Domain Users                                      Security
# CC_IFS_Users_Test                                 Security
# CC_IFS_Users                                      Security
# Windchill                                         Security
# CC_Jira_Users                                     Security
# CC_Confluence_Users                               Security
# Cimcorp Automation Ltd                            Security
# CCNA_CustomerSupportTeamCCNA                  Distribution
# CCNA_HelpDesk                                 Distribution
# CCNA_Customer Support Team                    Distribution
# CCNA Users                                        Security
# CCNA Customer Care                                Security
# CCNA Customer Care Visual Studio .NET Access      Security
# CCNA Electrical Design                            Security
# CCNA RADIUS Meraki WIFI Access                    Security
# CCNA RDP Checkpoint VPN Remote Users              Security
# CCNA Sales                                        Security
# CCNA Software                                     Security
# CC_Teamviewer_users                               Security
# CCNA Intranet                                     Security
# CCNA Software IT CS Printer                       Security
#
#
# Engineering - John Hordyk
# PS C:\WINDOWS\system32> Get-ADPrincipalGroupMembership -Identity jhor | select -Property name,groupcategory

# name                                 groupcategory
# ----                                 -------------
# Domain Users                              Security
# CC_IMS                                    Security
# CC_IFS_Users_Test                         Security
# CC_IFS_Users                              Security
# Windchill                                 Security
# CC_Confluence_Users                       Security
# Cimcorp Automation Ltd                    Security
# CCNA_EngineeringTeam                  Distribution
# CCNA_Inventor Users                   Distribution
# CCNA Users                                Security
# CCNA Engineering Team                     Security
# CCNA Inventor Users                       Security
# CCNA Mechanical Design                    Security
# CCNA RADIUS Meraki WIFI Access            Security
# CCNA RDP Checkpoint VPN Remote Users      Security
# CCNA Intranet                             Security
# CCNA Engineering Printer                  Security
#
#
# Human Resources - Rennae Baker
# PS C:\WINDOWS\system32> Get-ADPrincipalGroupMembership -Identity rbak | select -Property name,groupcategory

# name                                   groupcategory
# ----                                   -------------
# Domain Users                                Security
# CC_IMS                                      Security
# CC_IFS_Users_Test                           Security
# CC_IFS_Users                                Security
# Windchill                                   Security
# CC_Jira_Users                               Security
# CC_Confluence_Users                         Security
# Cimcorp Automation Ltd                      Security
# CCNA Users                                  Security
# CCNA Accident Incident                      Security
# CCNA Accounting Admin                       Security
# CCNA CIMO Project                           Security
# CCNA Human Resources Admin                  Security
# CCNA Joint Health and Safety Committee      Security
# CCNA Organization Users                     Security
# CCNA QHSE                                   Security
# CCNA RADIUS Meraki WIFI Access              Security
# CCNA RDP Checkpoint VPN Remote Users        Security
# CCNA Safety Users                           Security
# CCNA Intranet                               Security
# intranet-GeekyTeam                          Security
#
#
# IT - Steven Saltenberger
# PS C:\WINDOWS\system32> Get-ADPrincipalGroupMembership -Identity ssal | select -Property name,groupcategory

# name                                   groupcategory
# ----                                   -------------
# Domain Users                                Security
# CC_IMS                                      Security
# CC_IFS_Users_Test                           Security
# CC_IFS_Users                                Security
# Windchill                                   Security
# CC_Jira_Users                               Security
# CC_Confluence_Users                         Security
# CC_BitBucket_Users                          Security
# Cimcorp Automation Ltd                      Security
# CCNA Network Admin                          Security
# CCNA_JHSC_Members                       Distribution
# CCNA Users                                  Security
# CCNA Fax Operators                          Security
# CCNA Information Systems                    Security
# CCNA Inventor Users                         Security
# CCNA Joint Health and Safety Committee      Security
# CCNA Mechanical Design                      Security
# CCNA Organization Management                Security
# CCNA RADIUS Meraki WIFI Access              Security
# CCNA RDP Checkpoint VPN Remote Users        Security
# CCNA Traffic                                Security
# CC_Teamviewer_users                         Security
# CC_IT_SERVICES                              Security
# CCNA Server Room                            Security
# CiscoDuoTest                                Security
# CC_GLOBAL_CORP_IT                       Distribution
# cvsint                                      Security
# CCNA Intranet                               Security
# CCNA Software IT CS Printer                 Security
#
#
# Procurement - Bolivia Gil
# PS C:\WINDOWS\system32> Get-ADPrincipalGroupMembership -Identity bgil | select -Property name,groupcategory

# name                                 groupcategory
# ----                                 -------------
# Domain Users                              Security
# CC_IMS                                    Security
# CC_IFS_Users_Test                         Security
# CC_IFS_Users                              Security
# Windchill                                 Security
# CC_Jira_Users                             Security
# CC_Confluence_Users                       Security
# Cimcorp Automation Ltd                    Security
# CCNA_supplychainteam_na               Distribution
# CCNA_Purchasing                       Distribution
# CCNA Users                                Security
# CCNA Purchasing Users                     Security
# CCNA RADIUS Meraki WIFI Access            Security
# CCNA RDP Checkpoint VPN Remote Users      Security
# CCNA Visual Manufacturing                 Security
# CCNA Intranet                             Security
# CCNA Procurement Printer                  Security
#
#
# Production - Colton Valeri
# PS C:\WINDOWS\system32> Get-ADPrincipalGroupMembership -Identity cval | select -Property name,groupcategory

# name                                 groupcategory
# ----                                 -------------
# Domain Users                              Security
# CC_IMS                                    Security
# CC_IFS_Users_Test                         Security
# CC_IFS_Users                              Security
# Windchill                                 Security
# CC_Confluence_Users                       Security
# Cimcorp Automation Ltd                    Security
# CCNA_supplychainteam_na               Distribution
# CCNA_VisualUsers                      Distribution
# CCNA_ShopUsers                        Distribution
# CCNA Users                                Security
# CCNA Mechanical Design Browsers           Security
# CCNA Production                           Security
# CCNA Quality Control Browsers             Security
# CCNA RADIUS Meraki WIFI Access            Security
# CCNA RDP Checkpoint VPN Remote Users      Security
# CCNA Safety Users                         Security
# CCNA Traffic                              Security
# CCNA Shop Users                           Security
# CCNA Intranet                             Security
#
#
# Electrician - Marcin Kmiotek
# PS C:\WINDOWS\system32> Get-ADPrincipalGroupMembership -Identity mkmi | select -Property name,groupcategory

# name                                 groupcategory
# ----                                 -------------
# Domain Users                              Security
# CC_IMS                                    Security
# CC_IFS_Users_Test                         Security
# CC_IFS_Users                              Security
# Windchill                                 Security
# CC_Confluence_Users                       Security
# Cimcorp Automation Ltd                    Security
# CCNA_ShopUsers                        Distribution
# CCNA Users                                Security
# CCNA Electrical Design Browsers           Security
# CCNA RADIUS Meraki WIFI Access            Security
# CCNA RDP Checkpoint VPN Remote Users      Security
# CCNA Wire Tag                             Security
# CCNA Shop Users                           Security
# CCNA Intranet                             Security
#
#
# Automation Specialist - Mike Rowan
# PS C:\WINDOWS\system32> Get-ADPrincipalGroupMembership -Identity mrow | select -Property name,groupcategory

# name                                 groupcategory
# ----                                 -------------
# Domain Users                              Security
# CC_IMS                                    Security
# CC_IFS_Users_Test                         Security
# CC_IFS_Users                              Security
# Windchill                                 Security
# CC_Confluence_Users                       Security
# Cimcorp Automation Ltd                    Security
# CCNA_ShopUsers                        Distribution
# CCNA Users                                Security
# CCNA Mechanical Design Browsers           Security
# CCNA RADIUS Meraki WIFI Access            Security
# CCNA RDP Checkpoint VPN Remote Users      Security
# CCNA Shop Users                           Security
# CCNA Intranet                             Security
#
#
# Project Management - Ken Lacey
# PS C:\WINDOWS\system32> Get-ADPrincipalGroupMembership -Identity klac | select -Property name,groupcategory

# name                                 groupcategory
# ----                                 -------------
# Domain Users                              Security
# CC_IMS                                    Security
# CC_IFS_Users_Test                         Security
# CC_IFS_Users                              Security
# Windchill                                 Security
# CC_Jira_Users                             Security
# CC_Confluence_Users                       Security
# Cimcorp Automation Ltd                    Security
# CCNA_ProjectManagers                  Distribution
# CCNA_1710_GFAuckland                  Distribution
# CCNA_1711_GFChristchurch              Distribution
# CCNA Users                                Security
# CCNA Project Managers                     Security
# CCNA Quote Users                          Security
# CCNA RADIUS Meraki WIFI Access            Security
# CCNA RDP Checkpoint VPN Remote Users      Security
# CCNA Sales                                Security
# cellcontrollernews                    Distribution
# CCNA Intranet                             Security
# CCNA Project Management Printer           Security
#
#
# QHSE - Dianne Meehan
# PS C:\WINDOWS\system32> Get-ADPrincipalGroupMembership -Identity dmee | select -Property name,groupcategory

# name                                   groupcategory
# ----                                   -------------
# Domain Users                                Security
# CC_IMS                                      Security
# CC_IFS_Users_Test                           Security
# CC_IFS_Users                                Security
# Windchill                                   Security
# CC_Jira_Users                               Security
# CC_Confluence_Users                         Security
# Cimcorp Automation Ltd                      Security
# CCNA_OperationsTeam                     Distribution
# CCNA_QHSE                               Distribution
# CCNA_JHSC_Members                       Distribution
# CCNA Users                                  Security
# CCNA Accident Incident                      Security
# CCNA ADAM Users                             Security
# CCNA Applications                           Security
# CCNA Customer Care Admin                    Security
# CCNA Customer Care                          Security
# CCNA Fax Operators                          Security
# CCNA FAX Users                              Security
# CCNA ISO                                    Security
# CCNA Joint Health and Safety Committee      Security
# CCNA Operations Team                        Security
# CCNA Purchasing Users                       Security
# CCNA QHSE                                   Security
# CCNA RADIUS Meraki WIFI Access              Security
# CCNA RDP Checkpoint VPN Remote Users        Security
# CCNA Safety Users                           Security
# CCNA Social Committee                       Security
# CCNA Intranet                               Security
# intranet-GeekyTeam                          Security
#
#
# Sales - Don Heelis
# PS C:\WINDOWS\system32> Get-ADPrincipalGroupMembership -Identity dhee | select -Property name,groupcategory

# name                                 groupcategory
# ----                                 -------------
# Domain Users                              Security
# CC_IMS                                    Security
# CC_IFS_Users_Test                         Security
# CC_IFS_Users                              Security
# Windchill                                 Security
# CC_Jira_Users                             Security
# CC_Confluence_Users                       Security
# Cimcorp Automation Ltd                    Security
# CCNA Users                                Security
# CCNA Project Financial Info               Security
# CCNA RADIUS Meraki WIFI Access            Security
# CCNA RDP Checkpoint VPN Remote Users      Security
# CCNA Sales Concepts                       Security
# CCNA Sales                                Security
# Bynder_Level1                             Security
# CCNA Intranet                             Security
# CCNA Sales Applications Printer           Security
#
#
# Marketing - Julie Babis
# PS C:\WINDOWS\system32> Get-ADPrincipalGroupMembership -Identity jbab | select -Property name,groupcategory

# name                                 groupcategory
# ----                                 -------------
# Domain Users                              Security
# CC_IMS                                    Security
# CC_IFS_Users_Test                         Security
# CC_IFS_Users                              Security
# Windchill                                 Security
# CC_Jira_Users                             Security
# CC_Confluence_Users                       Security
# Cimcorp Automation Ltd                    Security
# CCNA_IFSTeam                          Distribution
# CCNA_SalesGroup                       Distribution
# CCNA Users                                Security
# CCNA Marketing Users                      Security
# CCNA Engineering Team                     Security
# CCNA PDF Posting                          Security
# CCNA Quality Control Browsers             Security
# CCNA RADIUS Meraki WIFI Access            Security
# CCNA RDP Checkpoint VPN Remote Users      Security
# CCNA Sales                                Security
# Bynder_Level5                             Security
# CCNA_MARCOM                           Distribution
# CC_GLOBAL_MARCOM                      Distribution
# CCNA Intranet                             Security
# CCNA Sales Applications Printer           Security
# intranet-GeekyTeam                        Security
#
#
# Application Developer - Andreas Zoudis
# PS C:\WINDOWS\system32> Get-ADPrincipalGroupMembership -Identity azou | select -Property name,groupcategory

# name                                   groupcategory
# ----                                   -------------
# Domain Users                                Security
# CC_smsauth_allowed                          Security
# CC_IMS                                      Security
# CC_IFS_Users_Test                           Security
# CC_IFS_Users                                Security
# Windchill                                   Security
# CC_Jira_Users                               Security
# CC_Confluence_Users                         Security
# CC_BitBucket_Users                          Security
# Cimcorp Automation Ltd                      Security
# CCNA_Software                           Distribution
# CCNA_JHSC_Members                       Distribution
# CCNA Users                                  Security
# CCNA Electrical Design                      Security
# CCNA Joint Health and Safety Committee      Security
# CCNA RADIUS Meraki WIFI Access              Security
# CCNA RDP Checkpoint VPN Remote Users        Security
# CCNA Software                               Security
# CC_Teamviewer_users                         Security
# cvsint                                      Security
# CCNA Intranet                               Security
# CCNA_APPLICATION_DEVELOPERS             Distribution
# CCNA Software Printer                       Security
#
#
# RSI - Wayne Kamminga
# PS C:\WINDOWS\system32> Get-ADPrincipalGroupMembership -Identity wkam | select -Property name,groupcategory

# name                                 groupcategory
# ----                                 -------------
# Domain Users                              Security
# CC_IMS                                    Security
# CC_IFS_Users_Test                         Security
# CC_IFS_Users                              Security
# Windchill                                 Security
# CC_Jira_Users                             Security
# CC_Confluence_Users                       Security
# Cimcorp Automation Ltd                    Security
# CCNA_Software                         Distribution
# CCNA_1712                             Distribution
# CCNA Users                                Security
# CCNA RADIUS Meraki WIFI Access            Security
# CCNA RDP Checkpoint VPN Remote Users      Security
# CCNA Software                             Security
# CCNA Vol3 Users                           Security
# CC_Teamviewer_users                       Security
# CCNA Server Room                          Security
# CCNA Intranet                             Security
# CCNA_ROBOTICS_SYSTEMS_INTEGRATORS     Distribution
# CCNA Software IT CS Printer               Security
#
#
# Software Support - Rizwan Rana
# PS C:\WINDOWS\system32> Get-ADPrincipalGroupMembership -Identity rran | select -Property name,groupcategory

# name                                         groupcategory
# ----                                         -------------
# Domain Users                                      Security
# CC_IMS                                            Security
# CC_IFS_Users_Test                                 Security
# CC_IFS_Users                                      Security
# Windchill                                         Security
# CC_Jira_Users                                     Security
# CC_Confluence_Users                               Security
# Cimcorp Automation Ltd                            Security
# CCNA_CustomerSupportTeamCCNA                  Distribution
# CCNA_Software                                 Distribution
# CCNA_VisualUsers                              Distribution
# CCNA_HelpDesk                                 Distribution
# CCNA_Customer Support Team                    Distribution
# CCNA Users                                        Security
# CCNA Customer Care                                Security
# CCNA Customer Care Visual Studio .NET Access      Security
# CCNA Electrical Design Browsers                   Security
# CCNA RADIUS Meraki WIFI Access                    Security
# CCNA RDP Checkpoint VPN Remote Users              Security
# CCNA Software                                     Security
# CC_Teamviewer_users                               Security
# CCNA Intranet                                     Security
# CCNA Software IT CS Printer                       Security
#
#
# Warehouse - James Chagnon
# PS C:\WINDOWS\system32> Get-ADPrincipalGroupMembership -Identity jcha | select -Property name,groupcategory

# name                                 groupcategory
# ----                                 -------------
# Domain Users                              Security
# CC_IMS                                    Security
# CC_IFS_Users_Test                         Security
# CC_IFS_Users                              Security
# Windchill                                 Security
# CC_Jira_Users                             Security
# CC_Confluence_Users                       Security
# Cimcorp Automation Ltd                    Security
# CCNA_RMA_Admin                        Distribution
# CCNA Users                                Security
# CCNA Production                           Security
# CCNA Quality Control Browsers             Security
# CCNA RADIUS Meraki WIFI Access            Security
# CCNA RDP Checkpoint VPN Remote Users      Security
# CCNA Safety Users                         Security
# CCNA Traffic                              Security
# CCNA Intranet                             Security