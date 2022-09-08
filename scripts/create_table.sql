-- public.data_product_entity definition

CREATE TABLE public.data_product_entity (
	id varchar(36) NOT NULL GENERATED ALWAYS AS (((json ->> 'id'::text))) STORED,
	fullyqualifiedname varchar(256) NOT NULL GENERATED ALWAYS AS (((json ->> 'fullyQualifiedName'::text))) STORED,
	json jsonb NOT NULL,
	updatedat timestamp NOT NULL GENERATED ALWAYS AS ((json ->> 'updatedAt'::text)::timestamp) STORED,
	updatedby varchar(256) NOT NULL GENERATED ALWAYS AS (((json ->> 'updatedBy'::text))) STORED,
	deleted bool NULL GENERATED ALWAYS AS ((json ->> 'deleted'::text)::boolean) STORED,
	CONSTRAINT data_product_entity_fullyqualifiedname_key UNIQUE (fullyqualifiedname),
	CONSTRAINT data_product_entity_pkey PRIMARY KEY (id)
);

ALTER TABLE data_product_entity REPLICA IDENTITY FULL;

-- INSERT INTO data_product VALUES (1, 'fullyqualifiedname', '{"type_dp": "notebook", "owner": "anapalopes", "name": "test_dt_product", "description": "Testando a criação de repositorio"}', '2022-09-07', '2022-09-07', false);
