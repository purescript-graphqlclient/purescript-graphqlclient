module Examples.SwapiCustomScalars where

import Data.Newtype (class Newtype)
import GraphQLClient (class GraphQLDefaultResponseScalarDecoder, class ToGraphQLArgumentValue, ArgumentValue(..))
import Prelude
import Data.Argonaut.Decode (JsonDecodeError(..))
import Data.Argonaut.Decode.Decoders (decodeString) as ArgonautDecoders.Decoder
import Data.Either (note)
import Data.Int as Int

-- | Why this module?
-- | Because Id is a string by graphql spec
-- | But we want it to be Int without changing anything
-- | So, here is the example
-- | original name - ID
newtype Id
  = Id Int

derive newtype instance eqId :: Eq Id

derive newtype instance ordId :: Ord Id

derive newtype instance showId :: Show Id

derive instance newtypeId :: Newtype Id _

instance graphqlDefaultResponseScalarDecoderId :: GraphQLDefaultResponseScalarDecoder Id where
  graphqlDefaultResponseScalarDecoder = (map $ map Id) (note (TypeMismatch "Integer") <<< Int.fromString <=< ArgonautDecoders.Decoder.decodeString)

instance toGraphQLArgumentValueId :: ToGraphQLArgumentValue Id where
  toGraphQLArgumentValue (Id i) = i # Int.toStringAs Int.decimal >>> ArgumentValueString

-- | original name - PosixTime
newtype PosixTime
  = PosixTime String

derive newtype instance eqPosixTime :: Eq PosixTime

derive newtype instance ordPosixTime :: Ord PosixTime

derive newtype instance showPosixTime :: Show PosixTime

derive instance newtypePosixTime :: Newtype PosixTime _

derive newtype instance graphqlDefaultResponseScalarDecoderPosixTime :: GraphQLDefaultResponseScalarDecoder PosixTime

derive newtype instance toGraphQLArgumentValuePosixTime :: ToGraphQLArgumentValue PosixTime
