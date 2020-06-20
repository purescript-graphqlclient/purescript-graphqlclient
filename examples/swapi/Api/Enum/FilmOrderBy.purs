module Api.Enum.FilmOrderBy where

-- | original type - FilmOrderBy
data FilmOrderBy
  = CreatedAtAsc
  | CreatedAtDesc
  | DirectorAsc
  | DirectorDesc
  | EpisodeIdAsc
  | EpisodeIdDesc
  | IdAsc
  | IdDesc
  | IsPublishedAsc
  | IsPublishedDesc
  | OpeningCrawlAsc
  | OpeningCrawlDesc
  | ReleaseDateAsc
  | ReleaseDateDesc
  | TitleAsc
  | TitleDesc
  | UpdatedAtAsc
  | UpdatedAtDesc

fromToMap :: Array (String /\ FilmOrderBy)
fromToMap = ["createdAt_ASC" /\ CreatedAtAsc, "createdAt_DESC" /\ CreatedAtDesc, "director_ASC" /\ DirectorAsc, "director_DESC" /\ DirectorDesc, "episodeId_ASC" /\ EpisodeIdAsc, "episodeId_DESC" /\ EpisodeIdDesc, "id_ASC" /\ IdAsc, "id_DESC" /\ IdDesc, "isPublished_ASC" /\ IsPublishedAsc, "isPublished_DESC" /\ IsPublishedDesc, "openingCrawl_ASC" /\ OpeningCrawlAsc, "openingCrawl_DESC" /\ OpeningCrawlDesc, "releaseDate_ASC" /\ ReleaseDateAsc, "releaseDate_DESC" /\ ReleaseDateDesc, "title_ASC" /\ TitleAsc, "title_DESC" /\ TitleDesc, "updatedAt_ASC" /\ UpdatedAtAsc, "updatedAt_DESC" /\ UpdatedAtDesc]

instance filmOrderByGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder FilmOrderBy where
  graphqlDefaultResponseScalarDecoder = enumDecoder "FilmOrderBy" fromToMap
