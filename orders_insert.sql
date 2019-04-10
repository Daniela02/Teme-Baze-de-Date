INSERT INTO EMPLOYEE_TBL VALUES 
('311549902', 'STEPHENS', 'TINA', 'DAWN',  'RR 3 BOX 17A', 'GREENWOOD',
'IN', '47890', '3178784465');

INSERT INTO EMPLOYEE_TBL VALUES
('442346889', 'PLEW', 'LINDA', 'CAROL', '3301 BEACON', 'INDIANAPOLIS',
'IN', '46224', '3172978990');

INSERT INTO EMPLOYEE_TBL VALUES
('213764555', 'GLASS', 'BRANDON', 'SCOTT', '1710 MAIN ST', 'WHITELAND',
'IN', '47885', '3178984321');

INSERT INTO EMPLOYEE_TBL VALUES
('313782439', 'GLASS', 'JACOB', NULL, '3789 WHITE RIVER BLVD',
'INDIANAPOLIS', 'IN', '45734', '3175457676');

INSERT INTO EMPLOYEE_TBL VALUES
('220984332', 'WALLACE', 'MARIAH', NULL, '7889 KEYSTONE AVE',
'INDIANAPOLIS', 'IN', '46741', '3173325986');

INSERT INTO EMPLOYEE_TBL VALUES
('443679012', 'SPURGEON', 'TIFFANY',  NULL, '5 GEORGE COURT',
'INDIANAPOLIS', 'IN', '46234', '3175679007');

INSERT INTO EMPLOYEE_PAY_TBL VALUES 
('311549902', 'MARKETING', '23-MAY-1989',  NULL,  '05-MAY-1999',  40000, NULL);

INSERT INTO EMPLOYEE_PAY_TBL VALUES
('442346889', 'TEAM LEADER', '17-JUN-1990', 14.75, '06-JUN-1999', NULL, NULL);

INSERT INTO EMPLOYEE_PAY_TBL VALUES
('213764555', 'SALES MANAGER', '14-AUG-1994',  NULL, '01-AUG-2000', 30000, 2000);

INSERT INTO EMPLOYEE_PAY_TBL VALUES
('313782439', 'SALESMAN', '28-JUN-1997',  NULL, NULL, 20000, 1000);

INSERT INTO EMPLOYEE_PAY_TBL VALUES
('220984332', 'SHIPPER', '22-JUL-1996', 11.00, '01-JUL-1999', NULL, NULL);

INSERT INTO EMPLOYEE_PAY_TBL VALUES
('443679012', 'SHIPPER', '14-JAN-1991', 15.00, '01-JAN-2001', NULL, NULL);

INSERT INTO CUSTOMER_TBL VALUES 
('232', 'LESLIE GLEASON', '798 HARDAWAY DR', 'INDIANAPOLIS',
'IN', '47856', '3175457690', NULL);

INSERT INTO CUSTOMER_TBL VALUES
('109', 'NANCY BUNKER', 'APT A 4556 WATERWAY', 'BROAD RIPPLE', 'IN', 47950, 3174262323, NULL);

INSERT INTO CUSTOMER_TBL VALUES
('345', 'ANGELA DOBKO', 'RR3 BOX 76', 'LEBANON', 'IN', 49967, 7658970090, NULL);

INSERT INTO CUSTOMER_TBL VALUES
('090', 'WENDY WOLF', '3345 GATEWAY DR', 'INDIANAPOLIS', 'IN', 46224, 3172913421, NULL);

INSERT INTO CUSTOMER_TBL VALUES
('12', 'MARYS GIFT SHOP', '435 MAIN ST', 'DANVILLE', 'IL', 47978, 3178567221, 3178523434);

INSERT INTO CUSTOMER_TBL VALUES
('432', 'SCOTTYS MARKET', 'RR2 BOX 173', 'BROWNSBURG', 'IN', 45687, 3178529835, 3178529836);

INSERT INTO CUSTOMER_TBL VALUES
('333', 'JASONS AND DALLAS GOODIES', 'LAFAYETTE SQ MALL', 'INDIANAPOLIS', 'IN', 46222, 3172978886, 3172978887);

INSERT INTO CUSTOMER_TBL VALUES
('21', 'MORGANS CANDIES AND TREATS', '5657 W TENTH ST', 'INDIANAPOLIS', 'IN', 46234, 3172714398, NULL);

INSERT INTO CUSTOMER_TBL VALUES
('43', 'SCHYLERS NOVELTIES', '17 MAPLE ST', 'LEBANON', 'IN', 48990, 3174346758, NULL);

INSERT INTO CUSTOMER_TBL VALUES
('287', 'GAVINS PLACE', '9880 ROCKVILLE RD', 'INDIANAPOLIS', 'IN', 46244, 3172719991, 
3172719992);

INSERT INTO CUSTOMER_TBL VALUES
('288', 'HOLLYS GAMEARAMA', '567 US 31 SOUTH', 'WHITELAND', 'IN', 49980, 3178879023, NULL);

INSERT INTO CUSTOMER_TBL VALUES
('590', 'HEATHERS FEATHERS AND THINGS', '4090 N SHADELAND AVE', 'INDIANAPOLIS', 'IN', 43278, 3175456768, NULL);

INSERT INTO CUSTOMER_TBL VALUES
('610', 'REGANS HOBBIES INC', '451 GREEN ST', 'PLAINFIELD', 'IN', 46818, 3178393441, 3178399090);

INSERT INTO CUSTOMER_TBL VALUES
('560', 'ANDYS CANDIES', 'RR 1 BOX 34', 'NASHVILLE', 'IN', 48756, 8123239871, NULL);

INSERT INTO CUSTOMER_TBL VALUES
('221', 'RYANS STUFF', '2337 S SHELBY ST', 'INDIANAPOLIS', 'IN', 47834, 3175634402, NULL);

INSERT INTO PRODUCTS_TBL VALUES 
('11235', 'WITCHES COSTUME', '29.99');

INSERT INTO PRODUCTS_TBL VALUES
('222', 'PLASTIC PUMPKIN 18 INCH', '7.75');

INSERT INTO PRODUCTS_TBL VALUES
('13', 'FALSE PARAFFIN TEETH', '1.10');

INSERT INTO PRODUCTS_TBL VALUES
('90', 'LIGHTED LANTERNS', '14.50');

INSERT INTO PRODUCTS_TBL VALUES
('15', 'ASSORTED COSTUMES', '10.00');

INSERT INTO PRODUCTS_TBL VALUES
('9', 'CANDY CORN', '1.35');

INSERT INTO PRODUCTS_TBL VALUES
('6', 'PUMPKIN CANDY', '1.45');

INSERT INTO PRODUCTS_TBL VALUES
('87', 'PLASTIC SPIDERS', '1.05');

INSERT INTO PRODUCTS_TBL VALUES
('119', 'ASSORTED MASKS', '4.95');

INSERT INTO ORDERS_TBL VALUES 
('56A901', '232', '11235', '1', '22-OCT-1999', '213764555');

INSERT INTO ORDERS_TBL VALUES
('56A917', '12', '87', '100', '30-SEP-1999', '213764555');

INSERT INTO ORDERS_TBL VALUES
('32A132', '43', '222', '25', '10-OCT-1999', '313782439');

INSERT INTO ORDERS_TBL VALUES
('16C17', '090', '222', '2', '17-OCT-1999', '213764555');

INSERT INTO ORDERS_TBL VALUES
('18D778', '287', '90', '10', '17-OCT-1999', '442346889');

INSERT INTO ORDERS_TBL VALUES
('23E934', '432', '13', '20', '15-OCT-1999', '313782439');


COMMIT;




