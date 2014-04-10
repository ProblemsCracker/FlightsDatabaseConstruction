create table FLTRESV(Flight_num number,
                    Dep_Time timestamp,
                    F_Duration number,
                    Capacity number,
                    Seasonal number(1),
                    origin varchar(50 byte),
                    destinaiton varchar(50 byte),
                    request xmltype);