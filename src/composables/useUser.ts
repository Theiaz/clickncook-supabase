import { type User } from '@supabase/supabase-js'
import { computed } from 'vue'
import { useSession } from './useSession'

export function useUser() {
  const { session, hasSession } = useSession()

  const user = computed<User | undefined>(() => {
    if (hasSession.value) {
      return session.value?.user
    }
    return undefined
  })

  const isAuthenticated = computed<boolean>(() => !!user.value)

  return { user, isAuthenticated }
}
