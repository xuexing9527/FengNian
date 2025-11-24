import com.sun.net.httpserver.HttpServer;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.io.OutputStream;

/**
 * 最简 Java HTTP 服务示例
 * 直接使用 JDK 内置的 HttpServer，无需任何外部依赖
 */
public class SimpleHttpServer {
    public static void main(String[] args) {
        try {
            // 1. 创建 HttpServer 实例，绑定到 8080 端口，设置请求队列大小为 10（最大等待请求数）
            HttpServer server = HttpServer.create(new InetSocketAddress(8080), 10);

            // 2. 创建默认上下文（根路径 "/"），指定请求处理器
            server.createContext("/", (exchange) -> {
                // 设置响应状态码：200 OK
                exchange.sendResponseHeaders(200, 0);
                
                // 构建响应内容
                String response = "服务启动成功！\n";
                response += "服务地址：http://localhost:8080\n";
                response += "当前时间：" + System.currentTimeMillis();

                // 3. 获取响应输出流，写入响应内容
                try (OutputStream os = exchange.getResponseBody()) {
                    os.write(response.getBytes("UTF-8"));
                }
            });

            // 4. 启动服务（非阻塞，立即返回）
            server.start();
            System.out.println("服务已启动，监听端口：8080");
            System.out.println("访问地址：http://localhost:8080");

        } catch (IOException e) {
            System.err.println("服务启动失败：" + e.getMessage());
            e.printStackTrace();
        }
    }
}