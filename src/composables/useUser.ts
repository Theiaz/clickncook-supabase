import { computed, onMounted, ref } from 'vue'
import { supabase } from '@/supabase'
import { type User, type Session } from '@supabase/supabase-js'

const session = ref<Session>()

export function useUser() {
  const getSession = () => {
    supabase.auth.getSession().then(({ data }) => {
      session.value = data.session!
    })

    supabase.auth.onAuthStateChange((_, _session) => {
      session.value = _session!
    })
  }

  getSession() // load session immediatly because route guard needs it

  const hasSession = computed<boolean>(() => {
    return session.value != null
  })

  const isAuthenticated = computed<boolean>(() => {
    return !!user.value
  })

  const user = computed<User | undefined>(() => {
    if (hasSession.value) {
      console.log('session', session.value)
      return session.value!.user
    }
    return undefined
  })

  return { hasSession, user, isAuthenticated }
}
