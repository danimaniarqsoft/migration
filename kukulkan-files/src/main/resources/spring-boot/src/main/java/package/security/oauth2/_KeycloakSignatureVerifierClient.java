package <%=packageName%>.security.oauth2;

import io.github.jhipster.config.JHipsterProperties;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.security.jwt.crypto.sign.RsaVerifier;
import org.springframework.security.jwt.crypto.sign.SignatureVerifier;
import org.springframework.stereotype.Component;
import org.springframework.util.Base64Utils;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import sun.security.rsa.RSAKeyFactory;

import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.KeyFactory;
import java.security.PublicKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @author markus.oellinger
 */
@Component
public class KeycloakSignatureVerifierClient implements OAuth2SignatureVerifierClient implements {
    private final Logger log = LoggerFactory.getLogger(KeycloakSignatureVerifierClient.class);

    public KeycloakSignatureVerifierClient(@Qualifier("vanillaRestTemplate") RestTemplate restTemplate,
                                       JHipsterProperties jHipsterProperties) {
        super(restTemplate, jHipsterProperties);
    }

    @Override
    public SignatureVerifier getSignatureVerifier() throws Exception {
        String publicKeyEndpointUri = getTokenEndpoint().replace("/token", "/certs");
        HttpEntity<Void> request = new HttpEntity<Void>(new HttpHeaders());
        LinkedHashMap<String, List<Map<String, Object>>> result =
            restTemplate.getForObject(publicKeyEndpointUri, LinkedHashMap.class);
        Map<String, Object> properties = result.get("keys").get(0);
        BigInteger modulus = new BigInteger(1, Base64Utils.decodeFromUrlSafeString((String) properties.get("n")));
        BigInteger publicExponent = new BigInteger(1, Base64Utils.decodeFromString((String) properties.get("e")));
        try {
            PublicKey publicKey =
                KeyFactory.getInstance("RSA").generatePublic(new RSAPublicKeySpec(modulus, publicExponent));
            RSAPublicKey rsaKey = (RSAPublicKey) RSAKeyFactory.toRSAKey(publicKey);
            return new RsaVerifier(rsaKey);
        } catch (GeneralSecurityException ex) {
            log.error("could not create key verifier", ex);
            throw ex;
        }
    }

}
