INSERT INTO auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at) VALUES ('00000000-0000-0000-0000-000000000000', '7c0ffe18-5cff-4519-aa2b-9a82c065ceb9', 'authenticated', 'authenticated', 'foo@foo.de', '$2a$10$XzQqwPTGAW9UH9lGJ5PYkeAMaBYSt44/vk1a5klxqdyjGieSF8EJC', '2023-09-03 13:14:57.51121+00', NULL, '', NULL, '', NULL, '', '', NULL, '2023-09-03 13:14:57.512836+00', '{"provider": "email", "providers": ["email"]}', '{}', NULL, '2023-09-03 13:14:57.506079+00', '2023-09-03 13:14:57.514448+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL);

INSERT INTO auth.identities (id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at) VALUES ('7c0ffe18-5cff-4519-aa2b-9a82c065ceb9', '7c0ffe18-5cff-4519-aa2b-9a82c065ceb9', '{"sub": "7c0ffe18-5cff-4519-aa2b-9a82c065ceb9", "email": "foo@foo.de"}', 'email', '2023-09-03 13:14:57.510079+00', '2023-09-03 13:14:57.510096+00', '2023-09-03 13:14:57.510096+00');