# Issabel-country-at-userfield
Use userfield column at Asterisk CDR to complete with Country name  &amp; accountcode with a code of termination carrier.

The cc.csv file contains all the country codes with their respective names
And LDI prefix Code is 00, you could change as your needs.


Please put files at addons_scripts in order to be execute after every call hangup.


In this case Gateway for outgoing calls are:
'SIP/vox01'
'SIP/vox02'
'SIP/IPLAN_OUT'
'SIP/MP114'
'SIP/MP118'
'SIP/ECU_GXW4104-02'
'SIP/ECU_GXW4104-01'

I used this field to determine which provider ended the call.
