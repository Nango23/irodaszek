create or replace function number_of_orders_by_cust_fnc(p_ugyfel_id in ugyfel.ugyfel_id%type) return number is
  v_number_of_orders number;
begin
  select count(*) into v_number_of_orders from rendeles r where r.ugyfel_id = p_ugyfel_id;
  return(v_number_of_orders);
end number_of_orders_by_cust_fnc;
/
