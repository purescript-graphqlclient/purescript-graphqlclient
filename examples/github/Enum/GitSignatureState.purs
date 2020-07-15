module Examples.Github.Enum.GitSignatureState where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - GitSignatureState
data GitSignatureState
  = Valid
  | Invalid
  | MalformedSig
  | UnknownKey
  | BadEmail
  | UnverifiedEmail
  | NoUser
  | UnknownSigType
  | Unsigned
  | GpgverifyUnavailable
  | GpgverifyError
  | NotSigningKey
  | ExpiredKey
  | OcspPending
  | OcspError
  | BadCert
  | OcspRevoked

fromToMap :: Array (Tuple String GitSignatureState)
fromToMap = [Tuple "VALID" Valid, Tuple "INVALID" Invalid, Tuple "MALFORMED_SIG" MalformedSig, Tuple "UNKNOWN_KEY" UnknownKey, Tuple "BAD_EMAIL" BadEmail, Tuple "UNVERIFIED_EMAIL" UnverifiedEmail, Tuple "NO_USER" NoUser, Tuple "UNKNOWN_SIG_TYPE" UnknownSigType, Tuple "UNSIGNED" Unsigned, Tuple "GPGVERIFY_UNAVAILABLE" GpgverifyUnavailable, Tuple "GPGVERIFY_ERROR" GpgverifyError, Tuple "NOT_SIGNING_KEY" NotSigningKey, Tuple "EXPIRED_KEY" ExpiredKey, Tuple "OCSP_PENDING" OcspPending, Tuple "OCSP_ERROR" OcspError, Tuple "BAD_CERT" BadCert, Tuple "OCSP_REVOKED" OcspRevoked]

instance gitSignatureStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder GitSignatureState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "GitSignatureState" fromToMap

instance gitSignatureStateToGraphqlArgumentValue :: ToGraphqlArgumentValue GitSignatureState where
  toGraphqlArgumentValue =
    case _ of
      Valid -> ArgumentValueString "VALID"
      Invalid -> ArgumentValueString "INVALID"
      MalformedSig -> ArgumentValueString "MALFORMED_SIG"
      UnknownKey -> ArgumentValueString "UNKNOWN_KEY"
      BadEmail -> ArgumentValueString "BAD_EMAIL"
      UnverifiedEmail -> ArgumentValueString "UNVERIFIED_EMAIL"
      NoUser -> ArgumentValueString "NO_USER"
      UnknownSigType -> ArgumentValueString "UNKNOWN_SIG_TYPE"
      Unsigned -> ArgumentValueString "UNSIGNED"
      GpgverifyUnavailable -> ArgumentValueString "GPGVERIFY_UNAVAILABLE"
      GpgverifyError -> ArgumentValueString "GPGVERIFY_ERROR"
      NotSigningKey -> ArgumentValueString "NOT_SIGNING_KEY"
      ExpiredKey -> ArgumentValueString "EXPIRED_KEY"
      OcspPending -> ArgumentValueString "OCSP_PENDING"
      OcspError -> ArgumentValueString "OCSP_ERROR"
      BadCert -> ArgumentValueString "BAD_CERT"
      OcspRevoked -> ArgumentValueString "OCSP_REVOKED"
