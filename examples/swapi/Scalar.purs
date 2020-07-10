module Swapi.Scalar where

import Prelude
import GraphqlClient
import Data.Newtype

-- | original name - ID
newtype Id = Id String

derive newtype instance eqId :: Eq Id

derive newtype instance ordId :: Ord Id

derive instance newtypeId :: Newtype Id _

derive newtype instance graphqlDefaultResponseScalarDecoderId :: GraphqlDefaultResponseScalarDecoder Id

derive newtype instance toGraphqlArgumentValueId :: ToGraphqlArgumentValue Id

-- | original name - PosixTime
newtype PosixTime = PosixTime String

derive newtype instance eqPosixTime :: Eq PosixTime

derive newtype instance ordPosixTime :: Ord PosixTime

derive instance newtypePosixTime :: Newtype PosixTime _

derive newtype instance graphqlDefaultResponseScalarDecoderPosixTime :: GraphqlDefaultResponseScalarDecoder PosixTime

derive newtype instance toGraphqlArgumentValuePosixTime :: ToGraphqlArgumentValue PosixTime
