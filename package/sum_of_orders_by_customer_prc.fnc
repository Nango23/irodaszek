create or replace function sum_of_orders_by_customer_fnc(p_ugyfel_id in ugyfel.ugyfel_id%type) return number is
  v_sum_of_orders number;
begin
  Select sum(i.ar) into v_sum_of_orders  from rendeles_irodaiszek ri 
  inner join irodaiszek i on i.irodaiszek_id = ri.irodaiszek_id_e
  inner join rendeles r on r.rendeles_id = ri.rendeles_id_e
  where r.ugyfel_id = p_ugyfel_id
  group by r.ugyfel_id;
  
  return(v_sum_of_orders);
end sum_of_orders_by_customer_fnc;
/
