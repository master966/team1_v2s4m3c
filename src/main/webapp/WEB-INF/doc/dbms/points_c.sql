/**********************************/
/* Table Name: 포인트 적립/사용 */
/**********************************/
DROP TABLE points;

CREATE TABLE points(
    pointsno              NUMBER(10)  NOT NULL  PRIMARY KEY,
    memberno            NUMBER(10) NOT NULL,
    ordersno              NUMBER(10) NOT NULL,
    contents              VARCHAR(50) NOT NULL,
    point_change         NUMBER(10)  NOT NULL,
    points_date            DATE           NOT NULL,
    FOREIGN KEY (memberno) REFERENCES members (memberno),
    FOREIGN KEY (ordersno) REFERENCES orders (ordersno)
);

INSERT INTO points(pointsno, memberno, ordersno, contents, point_change, points_date)
VALUES(points_seq.nextval, 1, 1, '전승우의 웃음', 2300, sysdate);

DROP SEQUENCE points_seq;

CREATE SEQUENCE points_seq
    START WITH 1                -- 시작번호
    INCREMENT BY 1            -- 증가값
    MAXVALUE 999999999     -- 최대값
    CACHE 2                         -- 2번은 메모리에서만 계산
    NOCYCLE;                       -- 다시 1부터 생성되는것을 방지


SELECT points_date FROM points;

SELECT pointsno, memberno, ordersno, contents, point_change, points_date, r
    FROM (
        SELECT pointsno, memberno, ordersno, contents, point_change, points_date, rownum as r
        FROM points)
    WHERE r >0 AND r <= 2;

COMMENT ON TABLE points is '포인트';
COMMENT ON COLUMN points.poinstno is '포인트 번호';
COMMENT ON COLUMN points.memberno is '회원번호';
COMMENT ON COLUMN points.ordersno is '결제번호';
COMMENT ON COLUMN points.contents is '내용';
COMMENT ON COLUMN points.point_change is '포인트 적립금액';
COMMENT ON COLUMN points.points_date is '포인트 변경일';

commit;