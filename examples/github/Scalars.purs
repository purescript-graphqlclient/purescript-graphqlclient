module Examples.Github.Scalars where

import Prelude (class Eq, class Ord, class Show)
import Data.Newtype (class Newtype)
import GraphQLClient
  (class GraphQLDefaultResponseScalarDecoder, class ToGraphQLArgumentValue)

-- | original name - Date
newtype Date = Date String

derive newtype instance eqDate :: Eq Date

derive newtype instance ordDate :: Ord Date

derive newtype instance showDate :: Show Date

derive instance newtypeDate :: Newtype Date _

derive newtype instance graphQlDefaultResponseScalarDecoderDate :: GraphQLDefaultResponseScalarDecoder Date

derive newtype instance toGraphQlArgumentValueDate :: ToGraphQLArgumentValue Date

-- | original name - DateTime
newtype DateTime = DateTime String

derive newtype instance eqDateTime :: Eq DateTime

derive newtype instance ordDateTime :: Ord DateTime

derive newtype instance showDateTime :: Show DateTime

derive instance newtypeDateTime :: Newtype DateTime _

derive newtype instance graphQlDefaultResponseScalarDecoderDateTime :: GraphQLDefaultResponseScalarDecoder DateTime

derive newtype instance toGraphQlArgumentValueDateTime :: ToGraphQLArgumentValue DateTime

-- | original name - GitObjectID
newtype GitObjectId = GitObjectId String

derive newtype instance eqGitObjectId :: Eq GitObjectId

derive newtype instance ordGitObjectId :: Ord GitObjectId

derive newtype instance showGitObjectId :: Show GitObjectId

derive instance newtypeGitObjectId :: Newtype GitObjectId _

derive newtype instance graphQlDefaultResponseScalarDecoderGitObjectId :: GraphQLDefaultResponseScalarDecoder GitObjectId

derive newtype instance toGraphQlArgumentValueGitObjectId :: ToGraphQLArgumentValue GitObjectId

-- | original name - GitSSHRemote
newtype GitSshRemote = GitSshRemote String

derive newtype instance eqGitSshRemote :: Eq GitSshRemote

derive newtype instance ordGitSshRemote :: Ord GitSshRemote

derive newtype instance showGitSshRemote :: Show GitSshRemote

derive instance newtypeGitSshRemote :: Newtype GitSshRemote _

derive newtype instance graphQlDefaultResponseScalarDecoderGitSshRemote :: GraphQLDefaultResponseScalarDecoder GitSshRemote

derive newtype instance toGraphQlArgumentValueGitSshRemote :: ToGraphQLArgumentValue GitSshRemote

-- | original name - GitTimestamp
newtype GitTimestamp = GitTimestamp String

derive newtype instance eqGitTimestamp :: Eq GitTimestamp

derive newtype instance ordGitTimestamp :: Ord GitTimestamp

derive newtype instance showGitTimestamp :: Show GitTimestamp

derive instance newtypeGitTimestamp :: Newtype GitTimestamp _

derive newtype instance graphQlDefaultResponseScalarDecoderGitTimestamp :: GraphQLDefaultResponseScalarDecoder GitTimestamp

derive newtype instance toGraphQlArgumentValueGitTimestamp :: ToGraphQLArgumentValue GitTimestamp

-- | original name - HTML
newtype Html = Html String

derive newtype instance eqHtml :: Eq Html

derive newtype instance ordHtml :: Ord Html

derive newtype instance showHtml :: Show Html

derive instance newtypeHtml :: Newtype Html _

derive newtype instance graphQlDefaultResponseScalarDecoderHtml :: GraphQLDefaultResponseScalarDecoder Html

derive newtype instance toGraphQlArgumentValueHtml :: ToGraphQLArgumentValue Html

-- | original name - ID
newtype Id = Id String

derive newtype instance eqId :: Eq Id

derive newtype instance ordId :: Ord Id

derive newtype instance showId :: Show Id

derive instance newtypeId :: Newtype Id _

derive newtype instance graphQlDefaultResponseScalarDecoderId :: GraphQLDefaultResponseScalarDecoder Id

derive newtype instance toGraphQlArgumentValueId :: ToGraphQLArgumentValue Id

-- | original name - PreciseDateTime
newtype PreciseDateTime = PreciseDateTime String

derive newtype instance eqPreciseDateTime :: Eq PreciseDateTime

derive newtype instance ordPreciseDateTime :: Ord PreciseDateTime

derive newtype instance showPreciseDateTime :: Show PreciseDateTime

derive instance newtypePreciseDateTime :: Newtype PreciseDateTime _

derive newtype instance graphQlDefaultResponseScalarDecoderPreciseDateTime :: GraphQLDefaultResponseScalarDecoder PreciseDateTime

derive newtype instance toGraphQlArgumentValuePreciseDateTime :: ToGraphQLArgumentValue PreciseDateTime

-- | original name - URI
newtype Uri = Uri String

derive newtype instance eqUri :: Eq Uri

derive newtype instance ordUri :: Ord Uri

derive newtype instance showUri :: Show Uri

derive instance newtypeUri :: Newtype Uri _

derive newtype instance graphQlDefaultResponseScalarDecoderUri :: GraphQLDefaultResponseScalarDecoder Uri

derive newtype instance toGraphQlArgumentValueUri :: ToGraphQLArgumentValue Uri

-- | original name - X509Certificate
newtype X509Certificate = X509Certificate String

derive newtype instance eqX509Certificate :: Eq X509Certificate

derive newtype instance ordX509Certificate :: Ord X509Certificate

derive newtype instance showX509Certificate :: Show X509Certificate

derive instance newtypeX509Certificate :: Newtype X509Certificate _

derive newtype instance graphQlDefaultResponseScalarDecoderX509Certificate :: GraphQLDefaultResponseScalarDecoder X509Certificate

derive newtype instance toGraphQlArgumentValueX509Certificate :: ToGraphQLArgumentValue X509Certificate
