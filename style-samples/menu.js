// ---- Practice Problems dropdown in the site header ----
function closeMenus(except) {
  for (const b of document.querySelectorAll('.nav-menu-btn')) {
    if (b === except) continue;
    b.setAttribute('aria-expanded', 'false');
    document.getElementById(b.getAttribute('aria-controls')).hidden = true;
  }
}
document.addEventListener('click', e => {
  const btn = e.target.closest('.nav-menu-btn');
  if (btn) {
    const open = btn.getAttribute('aria-expanded') !== 'true';
    closeMenus(btn);
    btn.setAttribute('aria-expanded', String(open));
    document.getElementById(btn.getAttribute('aria-controls')).hidden = !open;
    return;
  }
  if (e.target.closest('.nav-item')) { closeMenus(); return; }
  if (!e.target.closest('.nav-dropdown')) closeMenus();
});
document.addEventListener('keydown', e => {
  if (e.key !== 'Escape') return;
  const open = document.querySelector('.nav-menu-btn[aria-expanded="true"]');
  if (open) { closeMenus(); open.focus(); }
});
