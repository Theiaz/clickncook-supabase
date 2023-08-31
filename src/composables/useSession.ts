import { supabase } from '@/supabase'
import type { Session } from '@supabase/supabase-js'
import { computed, ref } from 'vue'

const session = ref<Session>()

export function useSession() {
  const getSession = () => {
    supabase.auth.getSession().then(({ data }) => {
      session.value = data.session!
    })

    supabase.auth.onAuthStateChange((_, _session) => {
      session.value = _session!
    })
  }

  const hasSession = computed<boolean>(() => {
    return session.value != null
  })
  return { session, getSession, hasSession }
}
