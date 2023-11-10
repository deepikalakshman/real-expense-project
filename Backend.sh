dnf module disable nodejs -y

dnf module enable nodejs:18 -y

dnf install nodejs -y
cp backend.service /etc/systemd/system/backend.service
#we need to create this file before going into any directory so we are adding this point over here

useradd expense

mkdir /app
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip
cd /app
unzip /tmp/backend.zip
cd /app
npm install

cp backend.service /etc/systemd/system/backend.service

dnf install mysql -y
mysql -h <my sql.deepulucky.online> -uroot -pExpenseApp@1 < /app/schema/backend.sql
systemctl daemon-reload
systemctl enable backend
systemctl start backend
