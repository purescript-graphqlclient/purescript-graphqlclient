module Examples.SwapiCustomScalars where

import Data.Newtype
import GraphqlClient
import Prelude

import Data.Argonaut.Decode (JsonDecodeError(..))
import Data.Argonaut.Decode.Decoders (decodeString) as ArgonautDecoders.Decoder
import Data.Either (note)
import Data.Int as Int

-- | original name - ID
newtype Id = Id Int

derive newtype instance eqId :: Eq Id

derive newtype instance ordId :: Ord Id

derive newtype instance showId :: Show Id

derive instance newtypeId :: Newtype Id _

instance graphqlDefaultResponseScalarDecoderId :: GraphqlDefaultResponseScalarDecoder Id where
  graphqlDefaultResponseScalarDecoder = (map $ map Id) (note (TypeMismatch "Integer") <<< Int.fromString <=< ArgonautDecoders.Decoder.decodeString)

instance toGraphqlArgumentValueId :: ToGraphqlArgumentValue Id where
  toGraphqlArgumentValue (Id i) = i # Int.toStringAs Int.decimal >>> ArgumentValueString

-- | original name - PosixTime
newtype PosixTime = PosixTime String

derive newtype instance eqPosixTime :: Eq PosixTime

derive newtype instance ordPosixTime :: Ord PosixTime

derive newtype instance showPosixTime :: Show PosixTime

derive instance newtypePosixTime :: Newtype PosixTime _

derive newtype instance graphqlDefaultResponseScalarDecoderPosixTime :: GraphqlDefaultResponseScalarDecoder PosixTime

derive newtype instance toGraphqlArgumentValuePosixTime :: ToGraphqlArgumentValue PosixTime
