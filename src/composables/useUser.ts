import { type User } from '@supabase/supabase-js'
import { computed } from 'vue'
import { useSession } from './useSession'

export function useUser() {
  const { session, hasSession } = useSession()

  const user = computed<User | undefined>(() => {
    return hasSession.value ? session.value?.user : undefined
  })

  const isAuthenticated = computed<boolean>(() => !!user.value)

  return { user, isAuthenticated }
}
