package kr.co.porkandspoon.dto;

public class ResponseDTO<T> {
	
	private int status;			// HTTP 상태 코드
	private String message; 	// 응답 메시지
	private T data;
	
    // 기본 생성자
    public ResponseDTO() {}

    // 생성자
    public ResponseDTO(int status, String message, T data) {
        this.status = status;
        this.message = message;
        this.data = data;
    }

    // Getter & Setter
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}