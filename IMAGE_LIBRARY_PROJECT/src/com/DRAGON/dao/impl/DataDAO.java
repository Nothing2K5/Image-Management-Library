package com.DRAGON.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DataDAO {
	public Connection getConnection() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url = "jdbc:sqlserver://DESKTOP-B11V993:1433; databaseName=WEB_DEMO_PROJECT; integratedSecurity=true; encrypt=false";
			String user = "sa";
			String password = "@2005";
			return DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException | SQLException e) {
			return null; // ClassNotFoundException | SQLException e: multiple catch
		}
	}

	public void backupOrRestore(String choose) {
		String backupFilePath = "D:\\WEB_WORKSPACE\\WEB_DEMO_PROJECT";
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			connection = getConnection();
			if (choose.equals("backup")) {
				String backupQuery = "BACKUP DATABASE [WEB_DEMO_PROJECT] TO DISK = '" + backupFilePath + "'";
				statement = connection.prepareStatement(backupQuery);
				statement.executeQuery();
				System.out.println("Backup completed successfully.");
			} else if (choose.equals("restore")) {
				String restoreQuery = "RESTORE DATABASE [WEB_DEMO_PROJECT] FROM DISK = '" + backupFilePath
						+ "' WITH REPLACE";
				statement = connection.prepareStatement(restoreQuery);
				statement.executeQuery();
				System.out.println("Restore completed successfully.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
