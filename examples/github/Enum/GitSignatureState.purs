module Examples.Github.Enum.GitSignatureState where

import Prelude
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

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

derive instance eqGitSignatureState :: Eq GitSignatureState

derive instance ordGitSignatureState :: Ord GitSignatureState

fromToMap :: Array (Tuple String GitSignatureState)
fromToMap = [ Tuple "VALID" Valid
            , Tuple "INVALID" Invalid
            , Tuple "MALFORMED_SIG" MalformedSig
            , Tuple "UNKNOWN_KEY" UnknownKey
            , Tuple "BAD_EMAIL" BadEmail
            , Tuple "UNVERIFIED_EMAIL" UnverifiedEmail
            , Tuple "NO_USER" NoUser
            , Tuple "UNKNOWN_SIG_TYPE" UnknownSigType
            , Tuple "UNSIGNED" Unsigned
            , Tuple "GPGVERIFY_UNAVAILABLE" GpgverifyUnavailable
            , Tuple "GPGVERIFY_ERROR" GpgverifyError
            , Tuple "NOT_SIGNING_KEY" NotSigningKey
            , Tuple "EXPIRED_KEY" ExpiredKey
            , Tuple "OCSP_PENDING" OcspPending
            , Tuple "OCSP_ERROR" OcspError
            , Tuple "BAD_CERT" BadCert
            , Tuple "OCSP_REVOKED" OcspRevoked
            ]

instance gitSignatureStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                 GitSignatureState where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "GitSignatureState"
                                        fromToMap

instance gitSignatureStateToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                    GitSignatureState where
  toGraphqlArgumentValue =
    case _ of
      Valid -> ArgumentValueEnum "VALID"
      Invalid -> ArgumentValueEnum "INVALID"
      MalformedSig -> ArgumentValueEnum "MALFORMED_SIG"
      UnknownKey -> ArgumentValueEnum "UNKNOWN_KEY"
      BadEmail -> ArgumentValueEnum "BAD_EMAIL"
      UnverifiedEmail -> ArgumentValueEnum "UNVERIFIED_EMAIL"
      NoUser -> ArgumentValueEnum "NO_USER"
      UnknownSigType -> ArgumentValueEnum "UNKNOWN_SIG_TYPE"
      Unsigned -> ArgumentValueEnum "UNSIGNED"
      GpgverifyUnavailable -> ArgumentValueEnum "GPGVERIFY_UNAVAILABLE"
      GpgverifyError -> ArgumentValueEnum "GPGVERIFY_ERROR"
      NotSigningKey -> ArgumentValueEnum "NOT_SIGNING_KEY"
      ExpiredKey -> ArgumentValueEnum "EXPIRED_KEY"
      OcspPending -> ArgumentValueEnum "OCSP_PENDING"
      OcspError -> ArgumentValueEnum "OCSP_ERROR"
      BadCert -> ArgumentValueEnum "BAD_CERT"
      OcspRevoked -> ArgumentValueEnum "OCSP_REVOKED"
