
# How to set up project for servlet-JPA

## step1 : new project
![1](https://cdn.discordapp.com/attachments/1087034330863386684/1186233342883020820/image.png?ex=659280e4&is=65800be4&hm=9d0cb73a17161511892eff4d92c8bd5e9da24e58778f6a56991de6961683bf1e&)

![2](https://cdn.discordapp.com/attachments/1087034330863386684/1186234308881559592/image.png?ex=659281ca&is=65800cca&hm=d2ee0dbf17a56b7a7ab211af0491df97a0b2557035f5a489960960cff28b419d&)

---
## step 2 : add dependencies
```
<dependencies>
        <!--      jakarta.servlet:jakarta.servlet-api 5.0.0     -->
        <dependency>
            <groupId>jakarta.servlet</groupId>
            <artifactId>jakarta.servlet-api</artifactId>
            <version>5.0.0</version>
            <scope>provided</scope>
        </dependency>

        <!--      org.hibernate.orm:hibernate-core 6.0.2     -->
        <dependency>
            <groupId>org.hibernate.orm</groupId>
            <artifactId>hibernate-core</artifactId>
            <version>6.0.2.Final</version>
        </dependency>
        
        <!--      org.glassfish.jaxb:jaxb-runtime 3.0.2 -->
        <dependency>
            <groupId>org.glassfish.jaxb</groupId>
            <artifactId>jaxb-runtime</artifactId>
            <version>3.0.2</version>
        </dependency>

        <!--      org.hibernate.orm:hibernate-core 7.0.5    -->
        <dependency>
            <groupId>org.hibernate.validator</groupId>
            <artifactId>hibernate-validator</artifactId>
            <version>7.0.5.Final</version>
        </dependency>

        <dependency>
            <groupId>org.junit.jupiter</groupId>
            <artifactId>junit-jupiter-api</artifactId>
            <version>${junit.version}</version>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>org.junit.jupiter</groupId>
            <artifactId>junit-jupiter-engine</artifactId>
            <version>${junit.version}</version>
            <scope>test</scope>
        </dependency>
        
        <!-- add on	 --> 

        <!--      org.projectlombok:lombok 1.18.28   -->
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <version>1.18.28</version>
        </dependency>

        <!--     jakarta.servlet.jsp.jstl:jakarta.servlet.jsp.jstl-api 3.00     -->
        <dependency>
            <groupId>jakarta.servlet.jsp.jstl</groupId>
            <artifactId>jakarta.servlet.jsp.jstl-api</artifactId>
            <version>3.0.0</version>
        </dependency>

        <!--      org.glassfish.web:jakarta.servlet.jsp.jstl 3.0.1      -->
        <dependency>
            <groupId>org.glassfish.web</groupId>
            <artifactId>jakarta.servlet.jsp.jstl</artifactId>
            <version>3.0.1</version>
        </dependency>

        <!--      mysql:mysql-connector-java 8.0.33     -->
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>8.0.33</version>
        </dependency>

        <!--      org.glassfish.expressly:expressly 5.0.0   -->
        <dependency>
            <groupId>org.glassfish.expressly</groupId>
            <artifactId>expressly</artifactId>
            <version>5.0.0</version>
        </dependency>

        <!-- ไม่ใช้ -->
        <!-- https://mvnrepository.com/artifact/de.mkammerer/argon2-jvm -->
        <dependency>
            <groupId>de.mkammerer</groupId>
            <artifactId>argon2-jvm</artifactId>
            <version>2.11</version>
        </dependency>
</dependencies>
```
### u need to reload maven

## step 3 : connect to the Database(mySQL)
![3](https://cdn.discordapp.com/attachments/1087034330863386684/1186236292925751366/image.png?ex=659283a3&is=65800ea3&hm=3a285c516b313b59b81a036a1d12e859d890bfc5e2b1ade244d433cacf7a1dfc&)

![4](https://cdn.discordapp.com/attachments/1087034330863386684/1186236725018771516/image.png?ex=6592840a&is=65800f0a&hm=54cc961f791ecfaf49a0dfd372af4baedbaf282dc5112a8328ae3b2cb4fa8dce&)

and run sql script

##  step 4 : add persistence
```
	<persistence-unit name="classic-models">
        <provider>org.hibernate.jpa.HibernatePersistenceProvider</provider>

        -- add class example below -- 
        <class>sit.int202.classicmodels.entities.Office</class>
        <class>sit.int202.classicmodels.entities.Employee</class>
        -- 
        <properties>
            <property name="jakarta.persistence.jdbc.driver" value="com.mysql.cj.jdbc.Driver"/>
            <property name="jakarta.persistence.jdbc.url"
                      value="jdbc:mysql://localhost:3306/classicmodels"/>
            <property name="jakarta.persistence.jdbc.user" value="root"/>
            <property name="jakarta.persistence.jdbc.password" value="butter0025_P"/>
            <property name="hibernate.dialect" value="org.hibernate.dialect.MySQLDialect"/>
        </properties>
    </persistence-unit>
```
## step 5 evnironment
- class evnironment
- persistence-Unit
- class EntityManagerBuilder

## step 6 
### Add this method to every method repository.
![5](https://cdn.discordapp.com/attachments/1087034330863386684/1186306346518323313/image.png?ex=6592c4e1&is=65804fe1&hm=f2e505a69b8fe83b7dc8e867f16e3963b967a6d0b854284b1fc6fdea8ba37a95&)






