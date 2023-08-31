import { type User } from '@supabase/supabase-js'
import { computed } from 'vue'
import { useSession } from './useSession'

export function useUser() {
  const { session, hasSession } = useSession()

  const isAuthenticated = computed<boolean>(() => {
    return !!user.value
  })

  const user = computed<User | undefined>(() => {
    if (hasSession.value) {
      return session.value?.user
    }
    return undefined
  })

  return { hasSession, user, isAuthenticated }
}
