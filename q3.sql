select F.Flight_num, F.Dep_time, F.F_duration, xt.agent_name
from FLTRESV F, xmltable('$p/All_requests/Request'
                          passing F.request as "p"
                          columns agent_name varchar2(30) path 'Agent_name') xt
where F.seasonal = 0 and xt.agent_name = 'Tee Advantures'