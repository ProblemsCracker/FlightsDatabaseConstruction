select F.Flight_num, xt.agent_name, xt.contact_pho
from FLTRESV F, xmltable('$p/All_requests/Request'
                          passing F.request as "p"
                          columns agent_name varchar2(30) path 'Agent_name',
                                  contact_pho varchar2(30) path 'Contact_person/Phone') xt
where F.origin = 'Los Angeles';