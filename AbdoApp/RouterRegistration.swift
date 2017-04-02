import Alamofire

enum RouterRegistration: URLRequestConvertible {
    case create(deviceUUID: String, registrationUUID: String, parameters: Parameters)
    case read(deviceUUID: String, registrationUUID: String)
    case update(deviceUUID: String, registrationUUID: String, parameters: Parameters)
    case destroy(deviceUUID: String, registrationUUID: String)
    
    static let baseURLString = Singleton.SharedInstance.urlBase
    
    var method: HTTPMethod {
        switch self {
        case .create:
            return .post
        case .read:
            return .get
        case .update:
            return .put
        case .destroy:
            return .delete
        }
    }
    
    var path: String {
        switch self {
        case .create(let deviceUUID, let registrationUUID, _):
            return "/registration/\(deviceUUID)/\(registrationUUID)"
        case .read(let deviceUUID, let registrationUUID):
            return "/registration/\(deviceUUID)/\(registrationUUID)"
        case .update(let deviceUUID, let registrationUUID, _):
            return "/registration/\(deviceUUID)/\(registrationUUID)"
        case .destroy(let deviceUUID, let registrationUUID):
            return "/registration/\(deviceUUID)/\(registrationUUID)"
        }
    }
    
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try RouterRegistration.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .create(_, _, let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .update(_, _, let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        default:
            break
        }
        
        return urlRequest
    }
}
