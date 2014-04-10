select F.Flight_num, F.Dep_time, F.F_duration, xt.resv_F, xt.resv_TD, xt.resv_Num
from FLTRESV F, xmltable('$p/All_requests/Request'
                          passing F.request as "p"
                          columns agent_name varchar2(30) path 'Request/Agent_name',
                                  req_date date path 'Request_date',
                                  resv_F number path 'Reservation/Flight',
                                  resv_TD date path 'Reservation/Travel_date',
                                  resv_Num number path 'Reservation/Num_of_seats') xt
where xt.req_date < to_timestamp('10,10,2013', 'MM,DD,YYYY');