create table error_log(
  err_id      number,
  err_time    timestamp default sysdate,
  err_message varchar2(4000),
  err_value   varchar2(4000),
  api         varchar2(100)
);

create sequence error_log_seq start with 1;
