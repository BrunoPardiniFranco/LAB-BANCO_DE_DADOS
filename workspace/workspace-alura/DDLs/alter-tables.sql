-----------------------------------------TABLE SEG_MERCADO-----------------------------------------------------------
ALTER TABLE SEG_MERCADO ADD CONSTRAINT SEG_MERCADO_ID_PK PRIMARY KEY(ID);

---------------------------------------------------------------------------------------------------------------------

------------------------------------------------TABLE CLIENTE--------------------------------------------------------
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_ID_PK PRIMARY KEY(ID);

ALTER TABLE CLIENTE ADD CONSTRAINT SEG_MERCADO_ID_FK FOREIGN KEY(SEG_MERCADO_ID) REFERENCES SEG_MERCADO(ID);
---------------------------------------------------------------------------------------------------------------------