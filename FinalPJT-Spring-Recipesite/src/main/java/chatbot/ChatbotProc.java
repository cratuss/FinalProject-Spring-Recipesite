package chatbot;



//import android.media.MediaPlayer;
//import android.os.Environment;
import java.util.Base64; //챗봇 답변 - 이미지, 링크

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.Timestamp;
import java.util.Date;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.json.JSONArray;
import org.json.JSONObject;

public class ChatbotProc {

	public static void main(String[] args) {
		//main("질문", "api url", "secretkey");
		
		//멀티링크답변
		//String chatbot = main("오늘 날씨 어때요?",
		//	"https://7e53e914db53442d986b062deaca2d57.apigw.ntruss.com/custom/v1/5506/a60b2a281e6c42a070e684a513de269db4d7c6f75c64417b54ea1e6ec44010f2",
		//	"RG1VRkdiT01IalRqeVZ6UXlhUEhPRGZzaUVuT3BUaVU=");
		//System.out.println("멀티링크답변 = " + chatbot);
		
		//이미지답변
		//String chatbot = main("구글 이미지 검색 방법 알려주세요",
		//	"https://7e53e914db53442d986b062deaca2d57.apigw.ntruss.com/custom/v1/5506/a60b2a281e6c42a070e684a513de269db4d7c6f75c64417b54ea1e6ec44010f2",
		//	"RG1VRkdiT01IalRqeVZ6UXlhUEhPRGZzaUVuT3BUaVU=");
		//System.out.println("이미지답변 = " + chatbot);
		
		//기본답변
		//chatbot = main("챗봇이 하는 일은?",
		//	"https://7e53e914db53442d986b062deaca2d57.apigw.ntruss.com/custom/v1/5506/a60b2a281e6c42a070e684a513de269db4d7c6f75c64417b54ea1e6ec44010f2",
		//	"RG1VRkdiT01IalRqeVZ6UXlhUEhPRGZzaUVuT3BUaVU=");
		//System.out.println("기본답변 = " + chatbot);
		
		//웰컴메시지
		String chatbot = main("오늘 날씨 어때요?",
		"https://7e53e914db53442d986b062deaca2d57.apigw.ntruss.com/custom/v1/5506/a60b2a281e6c42a070e684a513de269db4d7c6f75c64417b54ea1e6ec44010f2",
		"RG1VRkdiT01IalRqeVZ6UXlhUEhPRGZzaUVuT3BUaVU=");
		System.out.println("웰컴메시지 = " + chatbot); //event : open
	}
	
	
	
	
  public static String main(String voiceMessage, String apiURL, String secretKey) {


        String chatbotMessage = "";

        try {
            URL url = new URL(apiURL);

            String message = getReqMessage(voiceMessage); 
            //메소드 내부 출력 - 현재시각 1/1000초 단위 출력 - ##1633401207401
            System.out.println("##" + message); 
            //##{"bubbles":[{"data":{... - 질문
            
            String encodeBase64String = makeSignature(message, secretKey);

            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/json;UTF-8");
            con.setRequestProperty("X-NCP-CHATBOT_SIGNATURE", encodeBase64String);

            // post request
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.write(message.getBytes("UTF-8"));
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();

            BufferedReader br;

            if(responseCode==200) { // Normal call
                System.out.println(con.getResponseMessage()); // ok 문구 출력하는 곳

                BufferedReader in = new BufferedReader(
                        new InputStreamReader(
                                con.getInputStream()));
                String decodedString;
                while ((decodedString = in.readLine()) != null) {
                    chatbotMessage = decodedString;
                }
                //chatbotMessage = decodedString;
                in.close();

            } else {  // Error occurred
                chatbotMessage = con.getResponseMessage();
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return chatbotMessage; //응답 리턴
    }

    public static String makeSignature(String message, String secretKey) {// 우리가보낸 secret key를 암호화 시키는 메소드

        String encodeBase64String = "";

        try {
            byte[] secrete_key_bytes = secretKey.getBytes("UTF-8");

            SecretKeySpec signingKey = new SecretKeySpec(secrete_key_bytes, "HmacSHA256");
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(signingKey);

            byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
/////////////////////////////////////////////////////////////////////////////
            //encodeBase64String = Base64.encodeToString(rawHmac, Base64.NO_WRAP);
            encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);          
            return encodeBase64String;

        } catch (Exception e){
            System.out.println(e);
        }

        return encodeBase64String;

    }

    public static String getReqMessage(String voiceMessage) {
    	//질문을 json 형태로 생성함
        String requestBody = "";

        try {

            JSONObject obj = new JSONObject();

            long timestamp = new Date().getTime();

            System.out.println("##"+timestamp);

            obj.put("version", "v2");
            obj.put("userId", "U47b00b58c90f8e47428af8b7bddc1231heo2");
//=> userId is a unique code for each chat user, not a fixed value, recommend use UUID. use different id for each user could help you to split chat history for users.

            obj.put("timestamp", timestamp);

            JSONObject bubbles_obj = new JSONObject();

            bubbles_obj.put("type", "text");

            JSONObject data_obj = new JSONObject();
            data_obj.put("description", voiceMessage);//질문 내용

            bubbles_obj.put("type", "text");
            bubbles_obj.put("data", data_obj);

            JSONArray bubbles_array = new JSONArray();
            bubbles_array.put(bubbles_obj);

            obj.put("bubbles", bubbles_array);
            //obj.put("event", "send"); // 질문-답변 표현
            //obj.put("event", "open"); // 웰컴메시지 표현
            obj.put("event", "getPersistentMenu"); // 고정메뉴 표현

            requestBody = obj.toString();

        } catch (Exception e){
            System.out.println("## Exception : " + e);
        }

        return requestBody;

    }
}
