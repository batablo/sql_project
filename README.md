## dockerでMySQL立ち上げるまでのコマンド

1. `docker-compose up -d --build`  
`build`(イメージの作成)と`up`(イメージを元にコンテナ作成)を合わせて実行する。  
`-d`はコンテナをバックグラウンドで実行するオプション(デタッチモード)。

1. `docker-compose ps`  
コンテナが立ち上がっているかの確認なので、省略してもOK！  
立ち上がっていればStateがUpになる。

1. `docker exec -it sql_project_mysql_1 bash`  
立ち上がっているコンテナの中でコマンドを実行できるようにする。  
ターミナル左側の$が/#の名前に切り替わればOK！  

1. `mysql -u root -p`  
mysqlの中に入るコマンド。  
passwordは`root`。


## 02/18時点での実装内容
現状、サンプルで社員管理のDBが入ってる。  
DB名は`sample_db`。  
DBの内容を変えたい時は下記のファイルを編集する。

- docker/mysql/DB/main_db.sql  
DDLとDMLのファイル。  
VSCodeで確認するとエラー文が出るけど正常に動く。  

- docker/mysql/DB/testdata.sql  
データ挿入用のファイル。  


