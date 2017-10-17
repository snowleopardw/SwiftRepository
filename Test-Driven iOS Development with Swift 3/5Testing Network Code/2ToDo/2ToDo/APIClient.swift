import UIKit

protocol SessionProtocol {
    func dataTask(
        with url: URL,
        completionHandler: @escaping
        (Data?, URLResponse?, Error?) -> Void)
        -> URLSessionDataTask
}
extension URLSession: SessionProtocol {}

class APIClient {


//    lazy var session: URLSession = URLSession.shared
    lazy var session: SessionProtocol = URLSession.shared as SessionProtocol

    func loginUser(withName username: String,
                   password: String,
                   completion: @escaping (Token?, Error?) -> Void) {

        let allowedCharacters = CharacterSet(
            charactersIn: "/%&=?$#+-~@<>|\\*,.()[]{}^!").inverted
        guard let encodedUsername = username.addingPercentEncoding(
            withAllowedCharacters: allowedCharacters) else { fatalError() }
        guard let encodedPassword = password.addingPercentEncoding(
            withAllowedCharacters: allowedCharacters) else { fatalError() }

//        let query = "username=\(username)&password=\(password)"
        let query = "username=\(encodedUsername)&password=\(encodedPassword)"
        
        guard let url = URL(string: "https://awesometodos.com/login?\(query)") else {
            fatalError()
        }
        session.dataTask(with: url) { (data, response, error) in
        }
    }

}
