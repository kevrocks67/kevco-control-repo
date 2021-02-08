class profile::base::users {
  lookup(profile::base::users::users).each |$user| {
    remote_auth::user { $user['title']:
      comment  => $user['comment'],
      k5logins => $user['k5logins'],
      pub_key  => $user['pub_key'],
    }
  }
}
