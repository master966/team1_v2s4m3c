/**********************************/
/* Table Name: �������� */
/**********************************/
DROP TABLE orders_detail;

CREATE TABLE orders_detail(
    orders_detailno         NUMBER(10)    NOT NULL  PRIMARY KEY,
    ordersno                 NUMBER(10)    NOT NULL,
    memberno              NUMBER(10)     NOT NULL,
    p_no                      NUMBER(10)      NOT NULL,
    p_name                  VARCHAR2(100)   NOT NULL,
    cnt                        NUMBER(10)       NOT NULL,
    p_price               NUMBER(10)       NOT NULL,
    pay                       NUMBER(10)       NOT NULL,
    thumb1                VARCHAR2(100)    NOT NULL,
    pay_date                DATE                 NOT NULL,
    FOREIGN KEY (ordersno) REFERENCES orders (ordersno),
    FOREIGN KEY (p_no) REFERENCES product (p_no),
    FOREIGN KEY (memberno) REFERENCES members (memberno)
);

COMMENT ON TABLE orders_detail is '��������';
COMMENT ON COLUMN orders_detail.orders_detailno is '�������ι�ȣ';
COMMENT ON COLUMN orders_detail.ordersno is '���� ��ȣ';
COMMENT ON COLUMN orders_detail.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN orders_detail.p_no is '��ǰ ��ȣ';
COMMENT ON COLUMN orders_detail.p_name is '��ǰ �̸�';
COMMENT ON COLUMN orders_detail.cnt is '����';
COMMENT ON COLUMN orders_detail.p_price is '�ݾ�';
COMMENT ON COLUMN orders_detail.pay is '�����ݾ�';
COMMENT ON COLUMN orders_detail.thumb1 is '�����';
COMMENT ON COLUMN orders_detail.pay_date is '������';

DROP SEQUENCE orders_detail_seq;

CREATE SEQUENCE orders_detail_seq
    START WITH 1                -- ���۹�ȣ
    INCREMENT BY 1            -- ������
    MAXVALUE 999999999     -- �ִ밪
    CACHE 2                         -- 2���� �޸𸮿����� ���
    NOCYCLE;                       -- �ٽ� 1���� �����Ǵ°��� ����
    
DELETE FROM orders_detail;
SELECT * FROM orders_detail;
commit;